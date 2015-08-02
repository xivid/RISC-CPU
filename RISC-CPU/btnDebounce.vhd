----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:01 08/02/2015 
-- Design Name: 
-- Module Name:    btnDebounce - Behavioral 
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

entity btnDebounce is
    Port ( CLK : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           btn_deb : out  STD_LOGIC);
end btnDebounce;

architecture Behavioral of btnDebounce is
    constant CNTR_MAX : std_logic_vector(15 downto 0) := (others => '1');
begin
    btn_debounce: process (CLK, btn)
        variable count: INTEGER := 0;
    begin
        if (rising_edge(CLK)) then
            if btn = '0' then
                if (count = CNTR_MAX) then
                    count := count;
                else
                    count := count + 1;
                end if;
                if count = CNTR_MAX - 1 then
                    btn_deb <= '0';
                else
                    btn_deb <= '1';
                end if;
            else
                count := 0;
            end if;
        end if;
    end process;


end Behavioral;

