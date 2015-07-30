--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:04:29 07/30/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbEXctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EXctrl
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
 
ENTITY tbEXctrl IS
END tbEXctrl;
 
ARCHITECTURE behavior OF tbEXctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EXctrl
    PORT(
         T1 : IN  std_logic;
         CLK : IN  std_logic;
         Rupdate : IN  std_logic;
         Raddr : IN  std_logic_vector(2 downto 0);
         Rdata : IN  std_logic_vector(7 downto 0);
         IR : IN  std_logic_vector(15 downto 0);
         Addr : OUT  std_logic_vector(15 downto 0);
         ALUOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal T1 : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Rupdate : std_logic := '0';
   signal Raddr : std_logic_vector(2 downto 0) := (others => '0');
   signal Rdata : std_logic_vector(7 downto 0) := (others => '0');
   signal IR : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Addr : std_logic_vector(15 downto 0);
   signal ALUOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EXctrl PORT MAP (
          T1 => T1,
			 CLK => CLK,
          Rupdate => Rupdate,
          Raddr => Raddr,
          Rdata => Rdata,
          IR => IR,
          Addr => Addr,
          ALUOUT => ALUOUT
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
		
		IR <= X"B000"; -- SETC
		wait for CLK_period/2;
		T1 <= '1';
		wait for CLK_period;
		T1 <= '0';
		wait for CLK_period*2;
		
		wait for CLK_period/2;
		IR <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		T1 <= '1';
		wait for CLK_period;
		T1 <= '0'; -- T2
		wait for CLK_period;
		Raddr <= "111"; -- T3
		Rdata <= X"00";
		wait for CLK_period/2;
		Rupdate <= '1';
		wait for CLK_period/2;
		Rupdate <= '0';
		
		wait for CLK_period/2;
		IR <= X"7301"; -- LDA R3, X"01" ([0001] = X"B0" -> R3)
		wait for CLK_period/2;
		T1 <= '1';
		wait for CLK_period;
		T1 <= '0'; -- T2
		wait for CLK_period;
		Raddr <= "011"; -- T3
		Rdata <= X"B0";
		wait for CLK_period/2;
		Rupdate <= '1';
		wait for CLK_period/2;
		Rupdate <= '0';
		
		
--		IR <= X"5203"; -- MOV R2, R3
--		IR <= X"A000"; -- CLRC
--		IR <= X"3203"; -- ADD R2, R3 (B0 + B0)
--		IR <= X"2207"; -- SUB R2, R7 (60 - 00 - 1)
--		IR <= X"4711"; -- MVI R7, X"11"
--		IR <= X"6201"; -- STA R2, X"01" (R2 = 5F -> [1101])
--		IR <= X"8401"; -- IN R4, "01" (R4 as ACC, IO[01] -> R4)
--		IR <= X"4700"; -- MVI R7, X"00"
--		IR <= X"4101"; -- MVI R1, X"01"
--      IR <= X"2401"; -- SUB R4, R1 (while(R4): output --R4 to IO[10])
--		IR <= X"9402"; -- OUT R4, "10" (R4 -> IO[10])
--		IR <= X"1402"; -- JZ R4, X"02" (jump over next statement)
--		IR <= X"00F8"; -- JMP X"F8" (jump to: SUB R4, R1)
--		IR <= X"9103"; -- OUT R1, "11" (R1 -> IO[11])

      wait;
   end process;

END;
