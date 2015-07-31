----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:47:57 07/31/2015 
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
			  CLOCK : in STD_LOGIC; -- for 7 seg display
           ABUS : out  STD_LOGIC_VECTOR (22 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           nMREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           nPREQ : out  STD_LOGIC;
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
			  btnU : in STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end CPU;

architecture Behavioral of CPU is
    COMPONENT CLKctrl
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         T : OUT  std_logic_vector(0 to 3)
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
		RST : IN std_logic;
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
			ABUS : OUT  std_logic_vector(22 downto 0);
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
	signal T : std_logic_vector(0 to 3) := "0001";
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal RDIR : std_logic;
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
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
   signal IRdata : std_logic_vector(15 downto 0) := (others => '0');
   signal Rtempdata : std_logic_vector(7 downto 0) := (others => '0');
	
	-- display module
	signal fpclock : STD_LOGIC;
	signal shift : STD_LOGIC_VECTOR(3 downto 0) :="0111";
	signal digit1, digit2, digit3, digit4 : STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	
	-- convert 4-bit data into Hexadecimal 7-seg display character
	function conv_seg(X : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
	begin
		case X is
			when "0000" => return "1000000"; -- 0
			when "0001" => return "1111001";
			when "0010" => return "0100100";
			when "0011" => return "0110000";
			when "0100" => return "0011001";
			when "0101" => return "0010010";
			when "0110" => return "0000010";
			when "0111" => return "1111000";
			when "1000" => return "0000000";
			when "1001" => return "0010000"; -- 9
			when "1010" => return "0001000"; -- A
			when "1011" => return "0000011"; -- b
			when "1100" => return "1000110"; -- C
			when "1101" => return "0100001"; -- d
			when "1110" => return "0000110"; -- E
			when "1111" => return "0001110"; -- F
			when others => return "1111111";
		end case;
	end conv_seg;
	
	component fp is
		port(CLK : in std_logic;
			  CLOCK : out std_logic);
	end component;
begin
	comCLK: CLKctrl PORT MAP (
          CLK => CLK,
          RST => RST,
          T => T
        );
   comIF: IFctrl PORT MAP (
          T0 => T(0),
          CLK => CLK,
          RST => RST,
          PCnew => PCnew,
          PCupdate => PCupdate,
          IRdata => IRdata,
          PCout => PC,
          RDIR => RDIR,
          IRout => IR
        );
	comEX: EXctrl PORT MAP (
          T1 => T(1),
			 CLK => CLK,
          Rupdate => Rupdate,
          Raddr => Raddr,
          Rdata => Rdata,
          IR => IR,
          Addr => Addrin,
          ALUOUT => ALUOUT
        );
   comMEM: MEMctrl PORT MAP (
          CLK => CLK,
          Addrin => Addrin,
          Addr => Addr,
          OP => IR(15 downto 11),
          DATA => Rtempdata,
          T2 => T(2),
          Rtemp => Rtemp,
          nMEM => nMEM,
          nIO => nIO,
          RD => RD,
          WR => WR
        );
   comWB: WBctrl PORT MAP (
			 RST => RST,
          CLK => CLK,
          Rtemp => Rtemp,
          PC => PC,
          Addr => Addr,
          ALUOUT => ALUOUT,
          T3 => T(3),
          OP => IR(15 downto 11),
          AD1 => IR(10 downto 8),
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
          PC => PC,
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
	
	comFP: fp port map(CLOCK, fpclock); 
	process(fpclock) -- 7 seg display control
	begin
		if(fpclock'event and fpclock = '1') then
			shift(1)<=shift(0);
			shift(2)<=shift(1);
			shift(3)<=shift(2);
			shift(0)<=shift(3);
			an <= shift; 
			case shift is
				  when "0111" => seg <= digit1;
				  when "1011" => seg <= digit2;
				  when "1101" => seg <= digit3;
				  when others => seg <= digit4;
			end case;
		end if;
	end process;
	
	digit1 <= (not T(0))&conv_seg(IR(15 downto 12)) when btnU = '0' else (not T(0))&conv_seg(PC(15 downto 12));
	digit2 <= (not T(1))&conv_seg(IR(11 downto 8)) when btnU = '0' else (not T(1))&conv_seg(PC(11 downto 8));
	digit3 <= (not T(2))&conv_seg(IR(7 downto 4)) when btnU = '0' else (not T(2))&conv_seg(PC(7 downto 4));
	digit4 <= (not T(3))&conv_seg(IR(3 downto 0)) when btnU = '0' else (not T(3))&conv_seg(PC(3 downto 0));
	
end Behavioral;

