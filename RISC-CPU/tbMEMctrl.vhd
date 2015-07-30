--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:26:00 07/30/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbMEMctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMctrl
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
 
ENTITY tbMEMctrl IS
END tbMEMctrl;
 
ARCHITECTURE behavior OF tbMEMctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MEMctrl
    PORT(
         CLK : IN  std_logic;
         Addrin : IN  std_logic_vector(15 downto 0);
         Addr : OUT  std_logic_vector(15 downto 0);
         OP : IN  std_logic_vector(4 downto 0);
         DATA : IN  std_logic_vector(7 downto 0);
         T2 : IN  std_logic;
         Rtemp : OUT  std_logic_vector(7 downto 0);
         nMEM : OUT  std_logic;
         nIO : OUT  std_logic;
         RD : OUT  std_logic;
         WR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Addrin : std_logic_vector(15 downto 0) := (others => '0');
   signal OP : std_logic_vector(4 downto 0) := (others => '0');
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal T2 : std_logic := '0';

 	--Outputs
   signal Addr : std_logic_vector(15 downto 0);
   signal Rtemp : std_logic_vector(7 downto 0);
   signal nMEM : std_logic;
   signal nIO : std_logic;
   signal RD : std_logic;
   signal WR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMctrl PORT MAP (
          CLK => CLK,
          Addrin => Addrin,
          Addr => Addr,
          OP => OP,
          DATA => DATA,
          T2 => T2,
          Rtemp => Rtemp,
          nMEM => nMEM,
          nIO => nIO,
          RD => RD,
          WR => WR
        );

   -- Clock process definitions
   CLK_process :process
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

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
