----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:17 07/30/2015 
-- Design Name: 
-- Module Name:    WBctrl - Behavioral 
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

entity WBctrl is
    Port ( RST : in  STD_LOGIC;
           Rtemp : in  STD_LOGIC_VECTOR (7 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           T3 : in  STD_LOGIC;
           Raddr : out  STD_LOGIC_VECTOR (2 downto 0);
           Rdata : out  STD_LOGIC_VECTOR (7 downto 0);
           Rupdate : out  STD_LOGIC;
           PCnew : out  STD_LOGIC_VECTOR (15 downto 0);
           PCupdate : out  STD_LOGIC);
end WBctrl;

architecture Behavioral of WBctrl is

begin


end Behavioral;

