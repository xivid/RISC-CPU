----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:54:48 07/30/2015 
-- Design Name: 
-- Module Name:    RamAccess - Behavioral 
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

entity RamAccess is
    Port ( sw : in  STD_LOGIC_VECTOR (7 downto 0);
			  clk : in STD_LOGIC;
           btnRDWordU : in  STD_LOGIC;
           btnWRD : in  STD_LOGIC;
           btnRDL : in  STD_LOGIC;
			  btnMEMR : in STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
			  led : out  STD_LOGIC_VECTOR (7 downto 0);
			  nBLE, nBHE, nMREQ, nRD, nWR : out  STD_LOGIC := '1';
			  ABUS : out STD_LOGIC_VECTOR (22 downto 0);
			  DBUS : inout STD_LOGIC_VECTOR (15 downto 0));
end RamAccess;

architecture Behavioral of RamAccess is
	signal clock : STD_LOGIC;
	signal shift : STD_LOGIC_VECTOR(3 downto 0) :="0111";
	signal digit1, digit2, digit3, digit4 : STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	signal addr, data : std_logic_vector (3 downto 0);
	
	-- convert 4-bit data into Hexadecimal 7-seg display character
	function conv_seg(X : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
	begin
		case X is
			when "0000" => return "11000000"; -- 0
			when "0001" => return "11111001";
			when "0010" => return "10100100";
			when "0011" => return "10110000";
			when "0100" => return "10011001";
			when "0101" => return "10010010";
			when "0110" => return "10000010";
			when "0111" => return "11111000";
			when "1000" => return "10000000";
			when "1001" => return "10010000"; -- 9
			when "1010" => return "10001000"; -- A
			when "1011" => return "10000011"; -- b
			when "1100" => return "10100111"; -- c
			when "1101" => return "10100001"; -- d
			when "1110" => return "10000110"; -- E
			when "1111" => return "10001110"; -- F
			when others => return "11111111";
		end case;
	end conv_seg;
	
	component fp is
		port(clk : in std_logic;
			  clock : out std_logic);
	end component;
begin
	com1:fp port map(clk, clock); 
	process(clock)
	begin
		if(clock'event and clock = '1') then
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
	
	addr <= sw(7 downto 4);
	data <= sw(3 downto 0);
	
	process (btnRDwordU, btnWRD, btnRDL, btnMEMR, sw, addr, dbus, data)
	begin
		ABUS <= (others => '0');
		DBUS <= (others => 'Z');
		nMREQ <= '1';
		nWR <= '1';
		nBHE <= '1';
		nBLE <= '1';
		nRD <= '1';
		if (btnRDwordU or btnWRD or btnRDL or btnMEMR) = '0' then
			led <= sw;
		end if;
		if btnRDwordU = '1' then
			ABUS(22 downto 3) <= (others => '0');
			ABUS(2 downto 0) <= addr(3 downto 1);
			DBUS <= (others => 'Z');
			nMREQ <= '0';
			nWR <= '1';
			nBHE <= '0';
			nBLE <= '0'; -- 不管地址最低位是什么，都访问它对应的整个字
			nRD <= '0';
			digit1 <= conv_seg(DBUS(15 downto 12));
			digit2 <= conv_seg(DBUS(11 downto 8));
			digit3 <= conv_seg(DBUS(7 downto 4));
			digit4 <= conv_seg(DBUS(3 downto 0));
		end if;
		if btnMEMR = '1' and btnWRD = '1' then -- write byte
			ABUS(22 downto 3) <= (others => '0');
			ABUS(2 downto 0) <= addr(3 downto 1);
			DBUS <= data&data&data&data; -- 将data重复四遍
			nMREQ <= '0';
			nWR <= '0';
			nBHE <= not addr(0);
			nBLE <= addr(0); -- DBUS高位写入高位或DBUS低位写入低位
			nRD <= '1';
			led <= data&data;
		end if;
		if btnMEMR = '1' and btnRDL = '1' then -- read byte
			ABUS(22 downto 3) <= (others => '0');
			ABUS(2 downto 0) <= addr(3 downto 1);
			DBUS <= (others => 'Z');
			nMREQ <= '0';
			nWR <= '1';
			nBHE <= not addr(0);
			nBLE <= addr(0);
			nRD <= '0';
			digit1 <= conv_seg(DBUS(15 downto 12));
			digit2 <= conv_seg(DBUS(11 downto 8));
			digit3 <= conv_seg(DBUS(7 downto 4));
			digit4 <= conv_seg(DBUS(3 downto 0));
		end if;
	end process;

end Behavioral;

