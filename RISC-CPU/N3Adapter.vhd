----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:57 08/01/2015 
-- Design Name: 
-- Module Name:    N3Adapter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity N3Adapter is
    Port ( CLK: in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           btnr : in  STD_LOGIC;
           btns : in  STD_LOGIC;
           btnu : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
           --signal on connector JC 
           JC:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
           -- signal on connector JD
           --JD(4)register selection pin  (RS)
           --JD(5)selects between read/write modes (RW)
           --JD(6)enable signal for starting the data read/write (E)
           JD:	out std_logic_vector (6 downto 4);
           MemOE : out  STD_LOGIC;
           MemWR : out  STD_LOGIC;
           MemAdv : out  STD_LOGIC;
           MemWait : out  STD_LOGIC;
           MemClk : out  STD_LOGIC;
           RamCS : out  STD_LOGIC;
           RamCRE : out  STD_LOGIC;
           RamUB : out  STD_LOGIC;
           RamLB : out  STD_LOGIC;
           MemAdr : out  STD_LOGIC_VECTOR (26 downto 1);
           MemDB : inout  STD_LOGIC_VECTOR (15 downto 0));
end N3Adapter;

architecture Behavioral of N3Adapter is
------------------------------------------------------------------
--  Component Declarations
------------------------------------------------------------------
    component CPU
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           nMREQ : out  STD_LOGIC;
           nPREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           Cout : out  std_logic;
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           PC : out  STD_LOGIC_VECTOR (15 downto 0);
           R0 : out  STD_LOGIC_VECTOR (7 downto 0);
           R1 : out  STD_LOGIC_VECTOR (7 downto 0);
           R2 : out  STD_LOGIC_VECTOR (7 downto 0);
           R3 : out  STD_LOGIC_VECTOR (7 downto 0);
           R4 : out  STD_LOGIC_VECTOR (7 downto 0);
           R5 : out  STD_LOGIC_VECTOR (7 downto 0);
           R6 : out  STD_LOGIC_VECTOR (7 downto 0);
           R7 : out  STD_LOGIC_VECTOR (7 downto 0);
           T : out STD_LOGIC_VECTOR (3 downto 0);
           -- Interrupt
           nextService : in std_logic;
           intServicePort : in integer;
           intr : out std_logic_vector(7 downto 0);
           intrUpdate : out std_logic;
           isrUpdate : out std_logic
           );
    end component;
    
    component IOConv
    Port ( IOAD : in  STD_LOGIC_VECTOR (1 downto 0);
       IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
       nPREQ : in  STD_LOGIC;
       nPRD : in  STD_LOGIC;
       nPWR : in  STD_LOGIC;
       sw : in  STD_LOGIC_VECTOR (7 downto 0);
       led : out  STD_LOGIC_VECTOR (7 downto 0);
       nextService : out std_logic;
       intServicePort : out integer;
       intr : in std_logic_vector(7 downto 0);
       intrUpdate : in std_logic;
       isrUpdate : in std_logic
       );
    end component;
    
    component btnDebounce
    Port ( CLK : in std_logic;
           btn : in std_logic;
           btn_deb : out std_logic);
    end component;
    
    component PmodCLP
    Port ( 	RESET:	in std_logic;									--use BTNS as reset input
			CLK:	in std_logic;									--100 MHz clock input
			IR:     in std_logic_vector(15 downto 0);
            R0:     in std_logic_vector(7 downto 0);
            R1:     in std_logic_vector(7 downto 0);
            R2:     in std_logic_vector(7 downto 0);
            R3:     in std_logic_vector(7 downto 0);
            R4:     in std_logic_vector(7 downto 0);
            R5:     in std_logic_vector(7 downto 0);
            R6:     in std_logic_vector(7 downto 0);
            R7:     in std_logic_vector(7 downto 0);
			--lcd input signals
			--signal on connector JC 
			JC:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
            -- signal on connector JD
                --JD(4)register selection pin  (RS)
                --JD(5)selects between read/write modes (RW)
                --JD(6)enable signal for starting the data read/write (E)
            JD:	out std_logic_vector (6 downto 4)  
			);		
    end component;
    
    component segDisplay
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           btnu : in  STD_LOGIC;
           T : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           Cy : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;
------------------------------------------------------------------
--  Local Type Declarations
-----------------------------------------------------------------

    --  For CPU
    signal T : std_logic_vector(3 downto 0);
    signal IR : STD_LOGIC_VECTOR (15 downto 0);
    signal PC : STD_LOGIC_VECTOR (15 downto 0);
    signal Cout : std_logic;
    signal R0 : STD_LOGIC_VECTOR (7 downto 0);
    signal R1 : STD_LOGIC_VECTOR (7 downto 0);
    signal R2 : STD_LOGIC_VECTOR (7 downto 0);
    signal R3 : STD_LOGIC_VECTOR (7 downto 0);
    signal R4 : STD_LOGIC_VECTOR (7 downto 0);
    signal R5 : STD_LOGIC_VECTOR (7 downto 0);
    signal R6 : STD_LOGIC_VECTOR (7 downto 0);
    signal R7 : STD_LOGIC_VECTOR (7 downto 0);
    signal ABUS :  STD_LOGIC_VECTOR (15 downto 0);
    signal nRD : STD_LOGIC;
    signal nWR : STD_LOGIC;
    
    -- This signals are for IO controller.
    signal IODB : std_logic_vector(7 downto 0);
    signal IOAD : std_logic_vector(1 downto 0);
    signal nPREQ, nPRD, nPWR : std_logic;
    signal nextService : std_logic;
    signal intServicePort : integer;
    signal intr : std_logic_vector(7 downto 0);
    signal intrUpdate : std_logic;
    signal isrUpdate : std_logic;
    
    -- Debounce btnr
    signal btnr_deb : std_logic;
begin
    comBtnrDeb: btnDebounce port map(
                CLK => CLK,
                btn => btnr,
                btn_deb => btnr_deb);
    comPmodCLP: PmodCLP port map(
                RESET => btns,
                CLK => CLK,
                IR => IR,
                R0 => R0,
                R1 => R1,
                R2 => R2,
                R3 => R3,
                R4 => R4,
                R5 => R5,
                R6 => R6,
                R7 => R7,
                JC => JC,
                JD => JD);
    comCPU: CPU port map(
               RST => btns,
               CLK => btnr_deb,
               DBUS => MemDB,
               IODB => IODB,
               ABUS => ABUS,
               IOAD => IOAD,
               nMREQ => RamCS,
               nPREQ => nPREQ,
               nRD => MemOE,
               nWR => MemWR,
               nBHE => RamUB,
               nBLE => RamLB,
               nPRD => nPRD,
               nPWR => nPWR,
               Cout => Cout,
               IR => IR,
               PC => PC,
               R0 => R0,
               R1 => R1,
               R2 => R2,
               R3 => R3,
               R4 => R4,
               R5 => R5,
               R6 => R6,
               R7 => R7,
               T => T,
               nextService => nextService,
               intServicePort => intServicePort,
               intr => intr,
               intrUpdate => intrUpdate,
               isrUpdate => isrUpdate);
    comIOConv: IOConv port map(
               IOAD => IOAD,
               IODB => IODB,
               nPREQ => nPREQ,
               nPRD => nPRD,
               nPWR => nPWR,
               sw => sw,
               led => led,
               nextService => nextService,
               intServicePort => intServicePort,
               intr => intr,
               intrUpdate => intrUpdate,
               isrUpdate => isrUpdate);
	comsegDisplay: segDisplay port map(
            T => T,
            PC => PC,
            IR => IR,
            btnu => btnu,
            Cy => Cout,
            clk => clk,
            an => an,
            seg => seg);
            
    MemAdv <= '0';
    MemWait <= '0';
    MemClk <= '0';
    RamCRE <= '0';
    MemAdr(26 downto 16) <= (others => '0');
    MemAdr(15 downto 1) <= ABUS(15 downto 1);
    
end Behavioral;

