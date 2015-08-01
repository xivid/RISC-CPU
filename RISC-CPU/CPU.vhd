----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:37 08/01/2015 
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
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           nMREQ : out  STD_LOGIC;
           nPREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           PC : out  STD_LOGIC_VECTOR (15 downto 0);
           R0 : out  STD_LOGIC_VECTOR (7 downto 0);
           R1 : out  STD_LOGIC_VECTOR (7 downto 0);
           R2 : out  STD_LOGIC_VECTOR (7 downto 0);
           R3 : out  STD_LOGIC_VECTOR (7 downto 0);
           R4 : out  STD_LOGIC_VECTOR (7 downto 0);
           R5 : out  STD_LOGIC_VECTOR (7 downto 0);
           R6 : out  STD_LOGIC_VECTOR (7 downto 0);
           R7 : out  STD_LOGIC_VECTOR (7 downto 0);
           T : out STD_LOGIC_VECTOR (3 downto 0));
end CPU;

architecture Behavioral of CPU is
    signal mPC : std_logic_vector(15 downto 0) := (others => '0');
begin
    DBUS <= (others => 'Z');
    ABUS <= x"0000";
    nMREQ <= '1';
    nPREQ <= '1';
    nRD <= '1';
    nWR <= '1';
    nBHE <= '1';
    nBLE <= '1';
    nPRD <= '1';
    nPWR <= '1';
    IR <= X"1402";
    mPC <= mPC + 1 when CLK'event and CLK = '1';
    PC <= mPC;
    R0 <= X"00";
    R1 <= X"01";
    R2 <= X"02";
    R3 <= X"03";
    R4 <= X"04";
    R5 <= X"05";
    R6 <= X"06";
    R7 <= X"07";
end Behavioral;

