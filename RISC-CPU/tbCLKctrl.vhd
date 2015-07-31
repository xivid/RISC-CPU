--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:10 07/29/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbCLKctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLKctrl
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
 
ENTITY tbCLKctrl IS
END tbCLKctrl;
 
ARCHITECTURE behavior OF tbCLKctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLKctrl
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         T : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';

 	--Outputs
   signal T : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLKctrl PORT MAP (
          CLK => CLK,
          RST => RST,
          T => T
        );

   -- Clock process definitions
   clk_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;
		RST <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
