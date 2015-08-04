--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:50 08/04/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbINTctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: INTctrl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbINTctrl IS
END tbINTctrl;
 
ARCHITECTURE behavior OF tbINTctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT INTctrl
    PORT(
         intr : IN  std_logic_vector(7 downto 0);
         newImr : IN  std_logic_vector(7 downto 0);
         intrUpdate : IN  std_logic;
         imrUpdate : IN  std_logic;
         isrUpdate : IN  std_logic;
         entered : in std_logic;
         nextService : OUT  std_logic;
         intServicePort : OUT  integer;
         nowimr : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal intr : std_logic_vector(7 downto 0) := (others => '0');
   signal newImr : std_logic_vector(7 downto 0) := (others => '0');
   signal intrUpdate : std_logic := '0';
   signal imrUpdate : std_logic := '0';
   signal isrUpdate : std_logic := '0';
    signal entered : std_logic := '0';

 	--Outputs
   signal nextService : std_logic;
   signal intServicePort : integer;
   signal nowimr : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: INTctrl PORT MAP (
          intr => intr,
          newImr => newImr,
          intrUpdate => intrUpdate,
          imrUpdate => imrUpdate,
          isrUpdate => isrUpdate,
          entered => entered,
          nextService => nextService,
          intServicePort => intServicePort,
          nowimr => nowimr
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      intr <= "00000010";
      intrUpdate <= '1';
      wait for 100 ns;
      intr <= "00000000";
      intrUpdate <= '0';
      wait for 100 ns;
      entered <= '1';
      wait for 100 ns;
      entered <= '0';
      wait for 100 ns;
      newIMR <= "11101110";
      imrUpdate <= '1';
      wait for 100 ns;
      imrUpdate <= '0';
      wait for 100 ns;
      intr <= "00010000";
      intrUpdate <= '1';
      wait for 100 ns;
      intr <= "00000000";
      intrUpdate <= '0';
      wait for 100 ns;
      entered <= '1';
      wait for 100 ns;
      entered <= '0';
      wait for 100 ns;
      isrUpdate <= '1';
      wait for 100 ns;
      isrUpdate <= '0';
      wait;
   end process;

END;
