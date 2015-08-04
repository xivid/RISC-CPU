----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:37 08/01/2015 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
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
           Cout : out  STD_LOGIC;
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
end CPU;

architecture Behavioral of CPU is
    COMPONENT CLKctrl
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         T : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT IFctrl
	PORT(
		T0 : IN  std_logic;
		CLK : IN  std_logic;
		PCnew : IN  std_logic_vector(15 downto 0);
		IRdata : IN  std_logic_vector(15 downto 0);
		PCout : OUT  std_logic_vector(15 downto 0);
		RDIR : OUT  std_logic;
		IRout : OUT  std_logic_vector(15 downto 0)
	  );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT EXctrl
    Port (  CLK : in STD_LOGIC;
            T1 : in  STD_LOGIC;
            Rupdate : in  STD_LOGIC;
            Raddr : in  STD_LOGIC_VECTOR (2 downto 0);
            Rdata : in  STD_LOGIC_VECTOR (7 downto 0);
            IR : in  STD_LOGIC_VECTOR (15 downto 0);
            serviceAddr : in std_logic_vector (15 downto 0); -- 中断服务程序入口地址
            Cout : out std_logic;
            R0 : out STD_LOGIC_VECTOR (7 downto 0);
            R1 : out STD_LOGIC_VECTOR (7 downto 0);
            R2 : out STD_LOGIC_VECTOR (7 downto 0);
            R3 : out STD_LOGIC_VECTOR (7 downto 0);
            R4 : out STD_LOGIC_VECTOR (7 downto 0);
            R5 : out STD_LOGIC_VECTOR (7 downto 0);
            R6 : out STD_LOGIC_VECTOR (7 downto 0);
            R7 : out STD_LOGIC_VECTOR (7 downto 0);
            Addr : out  STD_LOGIC_VECTOR (15 downto 0) := X"0000";
            ALUOUT : out  STD_LOGIC_VECTOR (7 downto 0) := X"00";
            intr : out std_logic_vector (7 downto 0);
            intrUpdate : out std_logic;
            isrUpdate : out std_logic;
            RDINT : out std_logic;
            intAddr : out std_logic_vector(15 downto 0) -- 中断向量
         );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT MEMctrl
    Port ( Addrin : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : out  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           T2 : in  STD_LOGIC;
           nextService : in STD_LOGIC;
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0);
           nMEM : out  STD_LOGIC;
           nIO : out  STD_LOGIC;
           RD : out  STD_LOGIC;
           WR : out  STD_LOGIC;
           pushPC : out std_logic;
           popPC : out STD_LOGIC;
           pushr : out std_logic;
           popr : out std_logic);
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT WBctrl
    Port (  RST : in  STD_LOGIC;
            Rtemp : in  STD_LOGIC_VECTOR (7 downto 0);
            PC : in  STD_LOGIC_VECTOR (15 downto 0);
            Addr : in  STD_LOGIC_VECTOR (15 downto 0);
            ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
            T3 : in  STD_LOGIC;
            OP : in STD_LOGIC_VECTOR (15 downto 11); -- IR(15 downto 11)
            AD1 : in STD_LOGIC_VECTOR (10 downto 8); -- IR(10 downto 8)
            nextService : in std_logic;
            intServicePort : in integer;
            returnAddr : in std_logic_vector (15 downto 0);
            Raddr : out  STD_LOGIC_VECTOR (2 downto 0);
            Rdata : out  STD_LOGIC_VECTOR (7 downto 0);
            Rupdate : out  STD_LOGIC;
            PCnew : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT ACctrl
    Port ( nIO : in  STD_LOGIC;
           nMEM : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           WR : in  STD_LOGIC;
           RDIR : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           pushPC : in std_logic;
           popPC : in std_logic;
           RDINT : in std_logic;
           intAddr : in std_logic_vector(15 downto 0);
           pushr : in std_logic;
           popr : in std_logic;
           nBLE : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nMREQ : out  STD_LOGIC;
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           nPREQ : out  STD_LOGIC;
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0);
           returnAddr : out STD_LOGIC_VECTOR (15 downto 0);
           serviceAddr : out std_logic_vector (15 downto 0) -- 中断服务程序入口地址
           );
		END COMPONENT;
	--///////////////////////////////////////////////
    signal Tout : std_logic_vector(3 downto 0) := "1000";
    signal RDIR : std_logic := '0';
    signal RDINT : std_logic := '0';
    signal pushPC : std_logic := '0';
    signal popPC : std_logic := '0';
    signal pushr : std_logic := '0';
    signal popr : std_logic := '0';
    signal Addrin : std_logic_vector(15 downto 0) := (others => '0');
    signal ALUOUT : std_logic_vector(7 downto 0) := (others => '0');
    signal Addr : std_logic_vector(15 downto 0) := (others => '0');
    signal Rtemp : std_logic_vector(7 downto 0) := (others => '0');
    signal nMEM : std_logic := '1';
    signal nIO : std_logic := '1';
    signal RD : std_logic := '0';
    signal WR : std_logic := '0';  
    signal Raddr : std_logic_vector(2 downto 0) := (others => '0');
    signal Rdata : std_logic_vector(7 downto 0) := (others => '0');
    signal Rupdate : std_logic := '0';
    signal PCnew : std_logic_vector(15 downto 0) := (others => '0');
    signal IRdata, IRout, PCout : std_logic_vector(15 downto 0) := (others => '0');
    signal Rtempdata : std_logic_vector(7 downto 0) := (others => '0');
    signal intAddr : std_logic_vector(15 downto 0) := (others => '0');
    signal returnAddr : std_logic_vector(15 downto 0) := (others => '0');
    signal serviceAddr : std_logic_vector(15 downto 0) := (others => '0');
begin
   comCLK: CLKctrl PORT MAP (
          CLK => CLK,
          RST => RST,
          T => Tout
        );
   comIF: IFctrl PORT MAP (
          T0 => Tout(0),
          CLK => CLK,
          PCnew => PCnew,
          IRdata => IRdata,
          PCout => PCout,
          RDIR => RDIR,
          IRout => IRout
        );
	comEX: EXctrl PORT MAP (
          CLK => CLK,
          T1 => Tout(1),
          Rupdate => Rupdate,
          Raddr => Raddr,
          Rdata => Rdata,
          IR => IRout,
          serviceAddr => serviceAddr,
          Cout => Cout,
		  R0 => R0,
		  R1 => R1, 
		  R2 => R2,
		  R3 => R3,
		  R4 => R4,
		  R5 => R5,
		  R6 => R6,
		  R7 => R7,
          Addr => Addrin,
          ALUOUT => ALUOUT,
          intr => intr,
          intrUpdate => intrUpdate,
          isrUpdate => isrUpdate,
          RDINT => RDINT,
          intAddr => intAddr
        );
   comMEM: MEMctrl PORT MAP (
          Addrin => Addrin,
          Addr => Addr,
          IR => IRout,
          DATA => Rtempdata,
          T2 => Tout(2),
          nextService => nextService,
          Rtemp => Rtemp,
          nMEM => nMEM,
          nIO => nIO,
          RD => RD,
          WR => WR,
          pushPC => pushPC,
          popPC => popPC,
          pushr => pushr,
          popr => popr
        );
   comWB: WBctrl PORT MAP (
          RST => RST,
          Rtemp => Rtemp,
          PC => PCout,
          Addr => Addr,
          ALUOUT => ALUOUT,
          T3 => Tout(3),
          OP => IRout(15 downto 11),
          AD1 => IRout(10 downto 8),
          nextService => nextService,
          intServicePort => intServicePort,
          returnAddr => returnAddr,
          Raddr => Raddr,
          Rdata => Rdata,
          Rupdate => Rupdate,
          PCnew => PCnew
        );
	comAC: ACctrl PORT MAP (
          nIO => nIO,
          nMEM => nMEM,
          RD => RD,
          WR => WR,
          RDIR => RDIR,
          PC => PCout,
          Addr => Addr,
          ALUOUT => ALUOUT,
          pushPC => pushPC,
          popPC => popPC,
          RDINT => RDINT,
          intAddr => intAddr,
          pushr => pushr,
          popr => popr,
          nBLE => nBLE,
          nBHE => nBHE,
          ABUS => ABUS,
          nRD => nRD,
          nWR => nWR,
          nMREQ => nMREQ,
          DBUS => DBUS,
          IOAD => IOAD,
          IODB => IODB,
          nPRD => nPRD,
          nPWR => nPWR,
          nPREQ => nPREQ,
          IR => IRdata,
          Rtemp => Rtempdata,
          returnAddr => returnAddr,
          serviceAddr => serviceAddr
        );
    PC <= PCout;
    IR <= IRout;
    T <= Tout;
end Behavioral;

