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
    Port ( Addrin : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : out  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           T2 : in  STD_LOGIC;
           nextService : in std_logic;
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0);
           nMEM : out  STD_LOGIC;
           nIO : out  STD_LOGIC;
           RD : out  STD_LOGIC;
           WR : out  STD_LOGIC;
           pushPC : out std_logic;
           popPC : out STD_LOGIC;
           pushr : out std_logic;
           popr : out std_logic);
end MEMctrl;

architecture Behavioral of MEMctrl is

begin
	-- 送出地址
	Addr <= Addrin;
    
	-- 读写控制
	nMEM <= '0' when (T2 = '1' and (IR(15 downto 11) = "01110" or IR(15 downto 11) = "01100")) else '1'; -- sta, lda
	nIO <= '0' when (T2 = '1' and (IR(15 downto 11) = "10000" or IR(15 downto 11) = "10010")) else '1';
	WR <= '1' when (T2 = '1' and (IR(15 downto 11) = "01100" or IR(15 downto 11) = "10010")) else '0'; -- sta, out
	RD <= '1' when (T2 = '1' and (IR(15 downto 11) = "01110" or IR(15 downto 11) = "10000")) else '0'; -- lda, in
    pushr <= '1' when (T2 = '1' and (IR(15 downto 11) = "11100")) else '0';
    popr <= '1' when (T2 = '1' and (IR(15 downto 11) = "11110")) else '0';
    pushPC <= '1' when (T2 = '1' and IR(15 downto 11) = "11000" and nextService = '1') else '0';
    popPC <= '1' when (T2 = '1' and (IR(15 downto 11) = "11010")) else '0';
	
    -- 更新Rtemp
	Rtemp <= DATA when (T2 = '1' and (IR(15 downto 11) = "01110" or IR(15 downto 11) = "10000")) else unaffected;
end Behavioral;

