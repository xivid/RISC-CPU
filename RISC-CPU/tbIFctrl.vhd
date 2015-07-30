--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:57:20 07/29/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbIFctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   测试取指管理模块
-- 
-- VHDL Test Bench Created by ISE for module: IFctrl
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
 
ENTITY tbIFctrl IS
END tbIFctrl;
 
ARCHITECTURE behavior OF tbIFctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IFctrl
    PORT(
         T0 : IN  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PCnew : IN  std_logic_vector(15 downto 0);
         PCupdate : IN  std_logic;
         IRdata : IN  std_logic_vector(15 downto 0);
         PCout : OUT  std_logic_vector(15 downto 0);
         RDword : OUT  std_logic;
         IRout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal T0 : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal PCnew : std_logic_vector(15 downto 0) := (others => '0');
   signal PCupdate : std_logic := '0';
   signal IRdata : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PCout : std_logic_vector(15 downto 0);
   signal RDword : std_logic;
   signal IRout : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFctrl PORT MAP (
          T0 => T0,
          CLK => CLK,
          RST => RST,
          PCnew => PCnew,
          PCupdate => PCupdate,
          IRdata => IRdata,
          PCout => PCout,
          RDword => RDword,
          IRout => IRout
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
		RST <= '1';
      wait for clk_period*3;
		
		RST <= '0';
		wait for clk_period/2;
		
		T0 <= '1';
		wait for clk_period/4;
		IRdata <= X"9012";
		wait for clk_period/4;
		wait for clk_period/2;
		
		T0 <= '0';
		wait for clk_period*2; -- T3 = '1'
		PCnew <= X"0023";
		wait for clk_period/2;
		PCupdate <= '1';
		wait for clk_period/2;
		RST <= '1';
		PCnew <= X"0045";
		wait for clk_period/2;
		PCupdate <= '1';
		wait for clk_period/2;
      -- insert stimulus here 

      wait;
   end process;

END;
