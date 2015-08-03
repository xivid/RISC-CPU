----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:38 07/30/2015 
-- Design Name: 
-- Module Name:    MEMctrl - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMctrl is
    Port ( -- RST : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           Addrin : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : out  STD_LOGIC_VECTOR (15 downto 0);
           OP : in  STD_LOGIC_VECTOR (15 downto 11); -- IR(15 downto 11)
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           T2 : in  STD_LOGIC;
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0);
           nMEM : out  STD_LOGIC;
           nIO : out  STD_LOGIC;
           RD : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end MEMctrl;

architecture Behavioral of MEMctrl is

begin
	-- 送出地址
	Addr <= Addrin;
	
	-- 读写控制
	nMEM <= '0' when (T2 = '1' and (OP = "01110" or OP = "01100")) else '1';
	nIO <= '0' when (T2 = '1' and (OP = "10000" or OP = "10010")) else '1';
	WR <= '1' when (T2 = '1' and (OP = "01100" or OP = "10010")) else '0';
	RD <= '1' when (T2 = '1' and (OP = "01110" or OP = "10000")) else '0';

	-- 更新Rtemp
	Rtemp <= DATA when (T2 = '1' and (OP = "01110" or OP = "10000")) else unaffected;
end Behavioral;

