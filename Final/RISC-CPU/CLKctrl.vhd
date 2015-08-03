----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:09 07/29/2015 
-- Design Name: 时钟管理模块
-- Module Name:    CLKctrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 4-节拍发生器
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLKctrl is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           T : out  STD_LOGIC_VECTOR (3 downto 0));
end CLKctrl;
 
architecture Behavioral of CLKctrl is
signal tmp : STD_LOGIC_VECTOR (3 downto 0);
begin
	T <= tmp;
	tmp <= "1000" WHEN rst = '1' ELSE 
			 tmp(2 downto 0) & tmp(3) WHEN rising_edge(clk);
end Behavioral;

