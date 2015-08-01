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
           T : out STD_LOGIC_VECTOR (3 downto 0));
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
		RST : IN  std_logic;
		PCnew : IN  std_logic_vector(15 downto 0);
		PCupdate : IN  std_logic;
		IRdata : IN  std_logic_vector(15 downto 0);
		PCout : OUT  std_logic_vector(15 downto 0);
		RDIR : OUT  std_logic;
		IRout : OUT  std_logic_vector(15 downto 0)
	  );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT EXctrl
	PORT(
		T1 : IN  std_logic;
		CLK : IN  std_logic;
		Rupdate : IN  std_logic;
		Raddr : IN  std_logic_vector(2 downto 0);
		Rdata : IN  std_logic_vector(7 downto 0);
		IR : IN  std_logic_vector(15 downto 0);
		R0 : out STD_LOGIC_VECTOR (7 downto 0);
		R1 : out STD_LOGIC_VECTOR (7 downto 0);
		R2 : out STD_LOGIC_VECTOR (7 downto 0);
		R3 : out STD_LOGIC_VECTOR (7 downto 0);
		R4 : out STD_LOGIC_VECTOR (7 downto 0);
		R5 : out STD_LOGIC_VECTOR (7 downto 0);
		R6 : out STD_LOGIC_VECTOR (7 downto 0);
		R7 : out STD_LOGIC_VECTOR (7 downto 0);
		Addr : OUT  std_logic_vector(15 downto 0);
		ALUOUT : OUT  std_logic_vector(7 downto 0)
	  );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT MEMctrl
	PORT(
		CLK : IN  std_logic;
		Addrin : IN  std_logic_vector(15 downto 0);
		Addr : OUT  std_logic_vector(15 downto 0);
		OP : IN  std_logic_vector(4 downto 0);
		DATA : IN  std_logic_vector(7 downto 0);
		T2 : IN  std_logic;
		Rtemp : OUT  std_logic_vector(7 downto 0);
		nMEM : OUT  std_logic;
		nIO : OUT  std_logic;
		RD : OUT  std_logic;
		WR : OUT  std_logic
	  );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT WBctrl
	PORT(
		CLK : IN  std_logic;
		Rtemp : IN  std_logic_vector(7 downto 0);
		PC : IN  std_logic_vector(15 downto 0);
		Addr : IN  std_logic_vector(15 downto 0);
		ALUOUT : IN  std_logic_vector(7 downto 0);
		T3 : IN  std_logic;
		OP : IN  std_logic_vector(15 downto 11);
		AD1 : IN  std_logic_vector(10 downto 8);
		Raddr : OUT  std_logic_vector(2 downto 0);
		Rdata : OUT  std_logic_vector(7 downto 0);
		Rupdate : OUT  std_logic;
		PCnew : OUT  std_logic_vector(15 downto 0);
		PCupdate : OUT  std_logic
	  );
	END COMPONENT;
	--///////////////////////////////////////////////
	COMPONENT ACctrl
		PORT(
			nIO : IN  std_logic;
			nMEM : IN  std_logic;
			RD : IN  std_logic;
			WR : IN  std_logic;
			RDIR : IN  std_logic;
			PC : IN  std_logic_vector(15 downto 0);
			Addr : IN  std_logic_vector(15 downto 0);
			ALUOUT : IN  std_logic_vector(7 downto 0);
			nBLE : OUT  std_logic;
			nBHE : OUT  std_logic;
			ABUS : OUT  std_logic_vector(15 downto 0);
			nRD : OUT  std_logic;
			nWR : OUT  std_logic;
			nMREQ : OUT  std_logic;
			DBUS : INOUT  std_logic_vector(15 downto 0);
			IOAD : OUT  std_logic_vector(1 downto 0);
			IODB : INOUT  std_logic_vector(7 downto 0);
			nPRD : OUT  std_logic;
			nPWR : OUT  std_logic;
			nPREQ : OUT  std_logic;
			IR : OUT  std_logic_vector(15 downto 0);
			Rtemp : OUT  std_logic_vector(7 downto 0)
		  );
		END COMPONENT;
	--///////////////////////////////////////////////
	signal Tout : std_logic_vector(3 downto 0) := "1000";
   signal RDIR : std_logic;
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
   signal PCnew : std_logic_vector(15 downto 0) := (others => '0'); -- Gated clock?
   signal PCupdate : std_logic := '0';
   signal IRdata, IRout, PCout : std_logic_vector(15 downto 0) := (others => '0');
   signal Rtempdata : std_logic_vector(7 downto 0) := (others => '0');
begin
   comCLK: CLKctrl PORT MAP (
          CLK => CLK,
          RST => RST,
          T => Tout
        );
   comIF: IFctrl PORT MAP (
          T0 => Tout(0),
          CLK => CLK,
          RST => RST,
          PCnew => PCnew,
          PCupdate => PCupdate,
          IRdata => IRdata,
          PCout => PCout,
          RDIR => RDIR,
          IRout => IRout
        );
	comEX: EXctrl PORT MAP (
          T1 => Tout(1),
		  CLK => CLK,
          Rupdate => Rupdate,
          Raddr => Raddr,
          Rdata => Rdata,
          IR => IRout,
		  R0 => R0,
		  R1 => R1, 
		  R2 => R2,
		  R3 => R3,
		  R4 => R4,
		  R5 => R5,
		  R6 => R6,
		  R7 => R7,
          Addr => Addrin,
          ALUOUT => ALUOUT
        );
   comMEM: MEMctrl PORT MAP (
          CLK => CLK,
          Addrin => Addrin,
          Addr => Addr,
          OP => IRout(15 downto 11),
          DATA => Rtempdata,
          T2 => Tout(2),
          Rtemp => Rtemp,
          nMEM => nMEM,
          nIO => nIO,
          RD => RD,
          WR => WR
        );
   comWB: WBctrl PORT MAP (
          CLK => CLK,
          Rtemp => Rtemp,
          PC => PCout,
          Addr => Addr,
          ALUOUT => ALUOUT,
          T3 => Tout(3),
          OP => IRout(15 downto 11),
          AD1 => IRout(10 downto 8),
          Raddr => Raddr,
          Rdata => Rdata,
          Rupdate => Rupdate,
          PCnew => PCnew,
          PCupdate => PCupdate
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
          Rtemp => Rtempdata
        );
    PC <= PCout;
    IR <= IRout;
    T <= Tout;
end Behavioral;

