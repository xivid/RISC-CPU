----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:55 07/30/2015 
-- Design Name: 
-- Module Name:    ACctrl - Behavioral 
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

entity ACctrl is
    Port ( nIO : in  STD_LOGIC;
           nMEM : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           WR : in  STD_LOGIC;
           RDword : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           nBLE : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nMREQ : out  STD_LOGIC;
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           IOAD : out  STD_LOGIC_VECTOR (2 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           nPREQ : out  STD_LOGIC;
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0));
end ACctrl;

architecture Behavioral of ACctrl is

begin


end Behavioral;

