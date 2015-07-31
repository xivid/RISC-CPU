----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:19 01/08/2015 
-- Design Name: 
-- Module Name:    fp - Behavioral 
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

entity fp is
port(clk:in std_logic;
     clock:out std_logic);
end fp;

architecture Behavioral of fp is
	signal js:std_logic_vector(15 downto 0):= (others => '0');
begin

process(clk)
begin
	if(rising_edge(clk)) then 
		js<=js+'1';
	end if;
end process;

clock<=js(15);

end Behavioral;

