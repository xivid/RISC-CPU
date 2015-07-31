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
    
	signal IR : std_logic_vector(15 downto 0) := (others => '0');
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
	OP <= IR(15 downto 11);
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
		
		IR <= X"B000"; -- SETC
		wait for CLK_period/2;
		Addrin <= X"7700";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		Addrin <= X"7700";
		wait for CLK_period;
		T2 <= '1'; -- T2
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"7301"; -- LDA R3, X"01" ([0001] = X"B0" -> R3)
		wait for CLK_period/2;
		Addrin <= x"0001"; -- test x <=> X
		wait for CLK_period;
		T2 <= '1'; -- T2
		wait for CLK_period/4;
		DATA <= X"B0";
		wait for CLK_period*3/4;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"5203"; -- MOV R2, R3
		wait for CLK_period/2;
		Addrin <= X"0003";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"A000"; -- CLRC
		wait for CLK_period/2;
		Addrin <= X"0000";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"3203"; -- ADD R2, R3 (B0 + B0)
		wait for CLK_period/2;
		Addrin <= X"0003";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"2207"; -- SUB R2, R7 (60 - 00 - 1)
		wait for CLK_period/2;
		Addrin <= X"0007";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"4711"; -- MVI R7, X"11"
		wait for CLK_period/2;
		Addrin <= X"0011";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"6201"; -- STA R2, X"01" (R2 = 5F -> [1101])
		wait for CLK_period/2;
		Addrin <= X"1101";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"8401"; -- IN R4, "01" (R4 as ACC, IO[01] -> R4)
		wait for CLK_period/2;
		Addrin <= X"1101";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period/4;
		DATA <= x"01"; -- assume input x"01"
		wait for CLK_period*3/4;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		Addrin <= X"1100";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"4101"; -- MVI R1, X"01"
		wait for CLK_period/2;
		Addrin <= X"0001";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"2401"; -- SUB R4, R1 (while(R4--): output R4 to IO[10])
		wait for CLK_period/2;
		Addrin <= X"0001";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"9402"; -- OUT R4, "10" (R4 -> IO[10])
		wait for CLK_period/2;
		Addrin <= X"0002";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"1402"; -- JZ R4, X"02" (jump over next statement)
		wait for CLK_period/2;
		Addrin <= X"0002";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

--		IR <= X"00F8"; -- JMP X"F8" (jump to: SUB R4, R1)

		wait for CLK_period/2;
		IR <= X"9103"; -- OUT R1, "11" (R1 -> IO[11])
		wait for CLK_period/2;
		Addrin <= X"0003";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

		wait for CLK_period/2;
		IR <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		Addrin <= X"FFFE";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;
		
		wait for CLK_period/2;
		IR <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		Addrin <= X"FFFE";
		wait for CLK_period;
		T2 <= '1';
		wait for CLK_period;
		T2 <= '0';
		wait for CLK_period;

      wait;
   end process;

END;
