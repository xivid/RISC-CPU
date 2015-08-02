----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:51 08/02/2015 
-- Design Name: 
-- Module Name:    segDisplay - Behavioral 
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

entity segDisplay is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           btnu : in  STD_LOGIC;
           T : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           btnr_deb : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end segDisplay;

architecture Behavioral of segDisplay is
	-- seg display control
    
	signal fpclock : STD_LOGIC;
    signal js : std_logic_vector(15 downto 0):= (others => '0');
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
begin
    -- Seg display
    process(clk)
    begin
        if(rising_edge(clk)) then 
            js<=js+'1';
        end if;
    end process;

    fpclock <= js(15);
    
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
    
    digit1 <= (not btnr_deb)&conv_seg(IR(15 downto 12)) when btnu = '1' else (not T(0))&conv_seg(PC(15 downto 12));
	digit2 <= (not btnr_deb)&conv_seg(IR(11 downto 8)) when btnu = '1' else (not T(1))&conv_seg(PC(11 downto 8));
	digit3 <= (not btnr_deb)&conv_seg(IR(7 downto 4)) when btnu = '1' else (not T(2))&conv_seg(PC(7 downto 4));
	digit4 <= (not btnr_deb)&conv_seg(IR(3 downto 0)) when btnu = '1' else (not T(3))&conv_seg(PC(3 downto 0));

end Behavioral;

