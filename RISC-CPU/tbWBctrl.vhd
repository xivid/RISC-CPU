--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:55:24 07/30/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbWBctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WBctrl
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
 
ENTITY tbWBctrl IS
END tbWBctrl;
 
ARCHITECTURE behavior OF tbWBctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WBctrl
    PORT(
         CLK : IN  std_logic;
         Rtemp : IN  std_logic_vector(7 downto 0);
         PC : IN  std_logic_vector(15 downto 0);
         Addr : IN  std_logic_vector(15 downto 0);
         ALUOUT : IN  std_logic_vector(7 downto 0);
         T3 : IN  std_logic;
         OP : IN  std_logic_vector(15 downto 11);
         AD1 : IN  std_logic_vector(10 downto 8);
         Raddr : OUT  std_logic_vector(2 downto 0);
         Rdata : OUT  std_logic_vector(7 downto 0);
         Rupdate : OUT  std_logic;
         PCnew : OUT  std_logic_vector(15 downto 0);
         PCupdate : OUT  std_logic
        );
    END COMPONENT;
    
	signal IR : std_logic_vector(15 downto 0) := (others => '0');
   --Inputs
   signal CLK : std_logic := '0';
   signal Rtemp : std_logic_vector(7 downto 0) := (others => '0');
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal Addr : std_logic_vector(15 downto 0) := (others => '0');
   signal ALUOUT : std_logic_vector(7 downto 0) := (others => '0');
   signal T3 : std_logic := '0';
   signal OP : std_logic_vector(15 downto 11) := (others => '0');
   signal AD1 : std_logic_vector(10 downto 8) := (others => '0');

 	--Outputs
   signal Raddr : std_logic_vector(2 downto 0);
   signal Rdata : std_logic_vector(7 downto 0);
   signal Rupdate : std_logic;
   signal PCnew : std_logic_vector(15 downto 0);
   signal PCupdate : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
	
	OP <= IR(15 downto 11);
	AD1 <= IR(10 downto 8);
	-- Instantiate the Unit Under Test (UUT)
   uut: WBctrl PORT MAP (
          CLK => CLK,
          Rtemp => Rtemp,
          PC => PC,
          Addr => Addr,
          ALUOUT => ALUOUT,
          T3 => T3,
          OP => OP,
          AD1 => AD1,
          Raddr => Raddr,
          Rdata => Rdata,
          Rupdate => Rupdate,
          PCnew => PCnew,
          PCupdate => PCupdate
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
      -- hold reset state for 90 ns.
      wait for 95 ns;	
		PC <= X"0000";
		wait for CLK_period/2;
		PC <= X"0002";
		IR <= X"B000"; -- SETC
		wait for CLK_period/2;
		Addr <= X"7700";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		-- T2 <= '0';
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		PC <= X"0002";
		wait for CLK_period/2;
		PC <= X"0004";
		IR <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		Addr <= X"7700";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"0006";
		IR <= X"7301"; -- LDA R3, X"01" ([0001] = X"B0" -> R3)
		wait for CLK_period/2;
		Addr <= x"0001"; -- test x <=> X
		wait for CLK_period;		
		-- T2 <= '1';
		wait for CLK_period/2;
		Rtemp <= X"B0";
		wait for CLK_period/2;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"0008";
		IR <= X"5203"; -- MOV R2, R3
		wait for CLK_period/2;
		Addr <= X"0003"; --T1
		wait for CLK_period/2;
		ALUOUT <= X"B0";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"000A";
		IR <= X"A000"; -- CLRC
		wait for CLK_period/2;
		Addr <= X"0000";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"000C";
		IR <= X"3203"; -- ADD R2, R3 (B0 + B0)
		wait for CLK_period/2;
		Addr <= X"0003";
		wait for CLK_period/2;
		ALUOUT <= X"60";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"000E";
		IR <= X"2207"; -- SUB R2, R7 (60 - 00 - 1)
		wait for CLK_period/2;
		Addr <= X"0007";
		wait for CLK_period/2;
		ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0010";
		IR <= X"4711"; -- MVI R7, X"11"
		wait for CLK_period/2;
		Addr <= X"0011";
		wait for CLK_period/2;
		ALUOUT <= X"11";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0012";
		IR <= X"6201"; -- STA R2, X"01" (R2 = 5F -> [1101])
		wait for CLK_period/2;
		Addr <= X"1101";
		wait for CLK_period/2;
		ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0014";
		IR <= X"8401"; -- IN R4, "01" (R4 as ACC, IO[01] -> R4)
		wait for CLK_period/2;
		Addr <= X"1101";
		wait for CLK_period;
		--T2 <= '1';
		wait for CLK_period/2;
		Rtemp <= X"01"; -- assume input x"01"
		wait for CLK_period/2;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0016";
		IR <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		Addr <= X"1100";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0018";
		IR <= X"4101"; -- MVI R1, X"01"
		wait for CLK_period/2;
		Addr <= X"0001";
		wait for CLK_period/2;
		ALUOUT <= X"01";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"001A";
		IR <= X"2401"; -- SUB R4, R1 (while(R4--): output R4 to IO[10])
		wait for CLK_period/2;
		Addr <= X"0001";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"001C";
		IR <= X"9402"; -- OUT R4, "10" (R4 -> IO[10])
		wait for CLK_period/2;
		Addr <= X"0002";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"001E";
		IR <= X"1402"; -- JZ R4, X"02" (jump over next statement)
		wait for CLK_period/2;
		Addr <= X"0002";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		PC <= X"0020";
		wait for CLK_period/2;
		wait for CLK_period/2;
		T3 <= '0';

--		IR <= X"00F8"; -- JMP X"F8" (jump to: SUB R4, R1)

		wait for CLK_period/2;
		PC <= X"0022";
		IR <= X"9103"; -- OUT R1, "11" (R1 -> IO[11])
		wait for CLK_period/2;
		Addr <= X"0003";
		wait for CLK_period/2;
		ALUOUT <= X"01";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		wait for CLK_period;
		T3 <= '0';

		wait for CLK_period/2;
		PC <= X"0024";
		IR <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		PC <= X"0022";
		wait for CLK_period/2;
		wait for CLK_period/2;
		T3 <= '0';
		
		wait for CLK_period/2;
		PC <= X"0024";
		IR <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		T3 <= '1';
		PC <= X"0022";
		wait for CLK_period/2;
		wait for CLK_period/2;
		T3 <= '0';
		
      wait;
   end process;

END;
