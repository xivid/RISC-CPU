--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:21 07/31/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbCPU.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
ENTITY tbCPU IS
END tbCPU;
 
ARCHITECTURE behavior OF tbCPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         CLOCK : IN  std_logic;
         ABUS : OUT  std_logic_vector(22 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
         nPREQ : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
         btnU : IN  std_logic;
         an : OUT  std_logic_vector(3 downto 0);
         seg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal btnU : std_logic := '0';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(22 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPREQ : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   signal an : std_logic_vector(3 downto 0);
   signal seg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          RST => RST,
          CLK => CLK,
          CLOCK => CLOCK,
          ABUS => ABUS,
          DBUS => DBUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          IOAD => IOAD,
          IODB => IODB,
          nPREQ => nPREQ,
          nPRD => nPRD,
          nPWR => nPWR,
          btnU => btnU,
          an => an,
          seg => seg
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RST <= '1';
      wait for 100 ns;	
		RST <= '0';
		wait for clk_period/2;

		-- PC <= X"0000";
		-- RDIR <= '1';
		DBUS <= X"B000"; -- SETC
		wait for CLK_period/2;
		-- RDIR <= '0';
		-- PC <= X"0002";
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		-- Addr <= X"7700";
		wait for CLK_period*3;
		
		-- PC <= X"0002";
		-- RDIR <= '1';
		DBUS <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		-- RDIR <= '0';
		-- PC <= X"0004";
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		-- Addr <= X"7700";
		wait for CLK_period/2;
		-- ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		-- RDIR <= '1';
		DBUS <= X"7301"; -- LDA R3, X"01" ([0001] = X"B0" -> R3)
		wait for CLK_period/2;
		-- PC <= X"0006";
		-- RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= x"0001"; -- test x <=> X
		wait for CLK_period;		
		--nMEM <= '0';
		--RD <= '1'; 
		DBUS <= X"B000";
		wait for CLK_period;
		--nMEM <= '1';
		--RD <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period;
		
		--RDIR <= '1';
		DBUS <= X"5203"; -- MOV R2, R3
		wait for CLK_period/2;
		--PC <= X"0008";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0003"; --T1
		wait for CLK_period/2;
		--ALUOUT <= X"B0";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		--RDIR <= '1';
		DBUS <= X"A000"; -- CLRC
		wait for CLK_period/2;
		--PC <= X"000A";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0000";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		--RDIR <= '1';
		DBUS <= X"3203"; -- ADD R2, R3 (B0 + B0)
		wait for CLK_period/2;
		--PC <= X"000C";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0003";
		wait for CLK_period/2;
		--ALUOUT <= X"60";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		--RDIR <= '1';
		DBUS <= X"2207"; -- SUB R2, R7 (60 - 00 - 1)
		wait for CLK_period/2;
		--PC <= X"000E";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0007";
		wait for CLK_period/2;
		--ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		--RDIR <= '1';
		DBUS <= X"4711"; -- MVI R7, X"11"
		wait for CLK_period/2;
		--PC <= X"0010";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0011";
		wait for CLK_period/2;
		--ALUOUT <= X"11";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		--RDIR <= '1';
		DBUS <= X"6201"; -- STA R2, X"01" (R2 = 5F -> [1101])
		wait for CLK_period/2;
		--PC <= X"0012";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"1101";
		wait for CLK_period/2;
		--ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		--nMEM <= '0';
		--WR <= '1';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period;
		--nMEM <= '1';
		--WR <= '0';
		wait for CLK_period;

		--RDIR <= '1';
		DBUS <= X"8401"; -- IN R4, "01" (R4 as ACC, IO[01] -> R4)
		wait for CLK_period/2;
		--PC <= X"0014";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"1101";
		wait for CLK_period;
		--T2 <= '1';
		--nIO <= '0';
		--RD <= '1';
		IODB <= X"01"; -- assume input 0x01
		wait for CLK_period;
		--nIO <= '1';
		--RD <= '0';
		IODB <= (others => 'Z');
		wait for CLK_period;
		
		--RDIR <= '1';
		DBUS <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		--PC <= X"0016";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"1100";
		wait for CLK_period/2;
		--ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		--RDIR <= '1';
		DBUS <= X"4101"; -- MVI R1, X"01"
		wait for CLK_period/2;
		--PC <= X"0018";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0001";
		wait for CLK_period/2;
		--ALUOUT <= X"01";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		--RDIR <= '1';
		DBUS <= X"2401"; -- SUB R4, R1 (while(R4--): output R4 to IO[10])
		wait for CLK_period/2;
		--PC <= X"001A";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0001";
		wait for CLK_period/2;
		--ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		--RDIR <= '1';
		DBUS <= X"9402"; -- OUT R4, "10" (R4 -> IO[10])
		wait for CLK_period/2;
		--PC <= X"001C";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0002";
		wait for CLK_period/2;
		--ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		--nIO <= '0';
		--WR <= '1';
		IODB <= (OTHERS => 'Z');
		wait for CLK_period;
		--nIO <= '1';
		--WR <= '0';
		wait for CLK_period;

		--RDIR <= '1';
		DBUS <= X"1402"; -- JZ R4, X"02" (jump over next statement)
		wait for CLK_period/2;
		--PC <= X"001E";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0002";
		wait for CLK_period/2;
		--ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		--PC <= X"0020";
		wait for CLK_period/2;
		-- T3 <= '0';

--		IR <= X"00F8"; -- JMP X"F8" (jump to: SUB R4, R1)

		--RDIR <= '1';
		DBUS <= X"9103"; -- OUT R1, "11" (R1 -> IO[11])
		wait for CLK_period/2;
		--PC <= X"0022";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"0003";
		wait for CLK_period/2;
		--ALUOUT <= X"01";
		wait for CLK_period/2;
		--nIO <= '0';
		--WR <= '1';
		IODB <= (OTHERS => 'Z');
		wait for CLK_period;
		--nIO <= '1';
		--WR <= '0';
		wait for CLK_period;

		--RDIR <= '1';
		DBUS <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		--PC <= X"0024";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		--PC <= X"0022";
		wait for CLK_period/2;
		-- T3 <= '0';
		
		--RDIR <= '1';
		DBUS <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		--PC <= X"0024";
		--RDIR <= '0';
		wait for CLK_period/2;
		DBUS <= (OTHERS => 'Z');
		--Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		--PC <= X"0022";
		wait for CLK_period/2;
		-- T3 <= '0';
      wait;
   end process;

END;

