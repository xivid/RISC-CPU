--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:18:43 07/31/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/tbACctrl.vhd
-- Project Name:  RISC-CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ACctrl
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
 
ENTITY tbACctrl IS
END tbACctrl;
 
ARCHITECTURE behavior OF tbACctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACctrl
    PORT(
         nIO : IN  std_logic;
         nMEM : IN  std_logic;
         RD : IN  std_logic;
         WR : IN  std_logic;
         RDIR : IN  std_logic;
         PC : IN  std_logic_vector(15 downto 0);
         Addr : IN  std_logic_vector(15 downto 0);
         ALUOUT : IN  std_logic_vector(7 downto 0);
         nBLE : OUT  std_logic;
         nBHE : OUT  std_logic;
         ABUS : OUT  std_logic_vector(22 downto 0);
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nMREQ : OUT  std_logic;
         DBUS : INOUT  std_logic_vector(15 downto 0);
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
         nPREQ : OUT  std_logic;
         IR : OUT  std_logic_vector(15 downto 0);
         Rtemp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nIO : std_logic := '1';
   signal nMEM : std_logic := '1';
   signal RD : std_logic := '0';
   signal WR : std_logic := '0';
   signal RDIR : std_logic := '0';
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal Addr : std_logic_vector(15 downto 0) := (others => '0');
   signal ALUOUT : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal nBLE : std_logic;
   signal nBHE : std_logic;
   signal ABUS : std_logic_vector(22 downto 0);
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nMREQ : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   signal nPREQ : std_logic;
   signal IR : std_logic_vector(15 downto 0);
   signal Rtemp : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	signal CLK : std_logic := '0';
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACctrl PORT MAP (
          nIO => nIO,
          nMEM => nMEM,
          RD => RD,
          WR => WR,
          RDIR => RDIR,
          PC => PC,
          Addr => Addr,
          ALUOUT => ALUOUT,
          nBLE => nBLE,
          nBHE => nBHE,
          ABUS => ABUS,
          nRD => nRD,
          nWR => nWR,
          nMREQ => nMREQ,
          DBUS => DBUS,
          IOAD => IOAD,
          IODB => IODB,
          nPRD => nPRD,
          nPWR => nPWR,
          nPREQ => nPREQ,
          IR => IR,
          Rtemp => Rtemp
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
		RDIR <= '1';
		DBUS <= X"B000"; -- SETC
		wait for CLK_period/2;
		RDIR <= '0';
		PC <= X"0002";
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"7700";
		wait for CLK_period*3;
		
		PC <= X"0002";
		RDIR <= '1';
		DBUS <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		RDIR <= '0';
		PC <= X"0004";
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"7700";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		RDIR <= '1';
		DBUS <= X"7301"; -- LDA R3, X"01" ([0001] = X"B0" -> R3)
		wait for CLK_period/2;
		PC <= X"0006";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= x"0001"; -- test x <=> X
		wait for CLK_period;		
		nMEM <= '0';
		RD <= '1'; 
		DBUS <= X"B000";
		wait for CLK_period;
		nMEM <= '1';
		RD <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period;
		
		RDIR <= '1';
		DBUS <= X"5203"; -- MOV R2, R3
		wait for CLK_period/2;
		PC <= X"0008";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0003"; --T1
		wait for CLK_period/2;
		ALUOUT <= X"B0";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		RDIR <= '1';
		DBUS <= X"A000"; -- CLRC
		wait for CLK_period/2;
		PC <= X"000A";
		DBUS <= (OTHERS => 'Z');
		RDIR <= '0';
		wait for CLK_period/2;
		Addr <= X"0000";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		RDIR <= '1';
		DBUS <= X"3203"; -- ADD R2, R3 (B0 + B0)
		wait for CLK_period/2;
		PC <= X"000C";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0003";
		wait for CLK_period/2;
		ALUOUT <= X"60";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		RDIR <= '1';
		DBUS <= X"2207"; -- SUB R2, R7 (60 - 00 - 1)
		wait for CLK_period/2;
		PC <= X"000E";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0007";
		wait for CLK_period/2;
		ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		RDIR <= '1';
		DBUS <= X"4711"; -- MVI R7, X"11"
		wait for CLK_period/2;
		PC <= X"0010";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0011";
		wait for CLK_period/2;
		ALUOUT <= X"11";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		RDIR <= '1';
		DBUS <= X"6201"; -- STA R2, X"01" (R2 = 5F -> [1101])
		wait for CLK_period/2;
		PC <= X"0012";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"1101";
		wait for CLK_period/2;
		ALUOUT <= X"5F";
		wait for CLK_period/2;
		-- T2 <= '1';
		nMEM <= '0';
		WR <= '1';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period;
		nMEM <= '1';
		WR <= '0';
		wait for CLK_period;

		RDIR <= '1';
		DBUS <= X"8401"; -- IN R4, "01" (R4 as ACC, IO[01] -> R4)
		wait for CLK_period/2;
		PC <= X"0014";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"1101";
		wait for CLK_period;
		--T2 <= '1';
		nIO <= '0';
		RD <= '1';
		IODB <= X"01"; -- assume input 0x01
		wait for CLK_period;
		nIO <= '1';
		RD <= '0';
		IODB <= (others => 'Z');
		wait for CLK_period;
		
		RDIR <= '1';
		DBUS <= X"4700"; -- MVI R7, X"00"
		wait for CLK_period/2;
		PC <= X"0016";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"1100";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;

		RDIR <= '1';
		DBUS <= X"4101"; -- MVI R1, X"01"
		wait for CLK_period/2;
		PC <= X"0018";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0001";
		wait for CLK_period/2;
		ALUOUT <= X"01";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		RDIR <= '1';
		DBUS <= X"2401"; -- SUB R4, R1 (while(R4--): output R4 to IO[10])
		wait for CLK_period/2;
		PC <= X"001A";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0001";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period*2;
		
		RDIR <= '1';
		DBUS <= X"9402"; -- OUT R4, "10" (R4 -> IO[10])
		wait for CLK_period/2;
		PC <= X"001C";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0002";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		nIO <= '0';
		WR <= '1';
		IODB <= (OTHERS => 'Z');
		wait for CLK_period;
		nIO <= '1';
		WR <= '0';
		wait for CLK_period;

		RDIR <= '1';
		DBUS <= X"1402"; -- JZ R4, X"02" (jump over next statement)
		wait for CLK_period/2;
		PC <= X"001E";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"0002";
		wait for CLK_period/2;
		ALUOUT <= X"00";
		wait for CLK_period/2;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		PC <= X"0020";
		wait for CLK_period/2;
		-- T3 <= '0';

--		IR <= X"00F8"; -- JMP X"F8" (jump to: SUB R4, R1)

		RDIR <= '1';
		DBUS <= X"9103"; -- OUT R1, "11" (R1 -> IO[11])
		wait for CLK_period/2;
		PC <= X"0022";
		DBUS <= (OTHERS => 'Z');
		RDIR <= '0';
		wait for CLK_period/2;
		Addr <= X"0003";
		wait for CLK_period/2;
		ALUOUT <= X"01";
		wait for CLK_period/2;
		nIO <= '0';
		WR <= '1';
		IODB <= (OTHERS => 'Z');
		wait for CLK_period;
		nIO <= '1';
		WR <= '0';
		wait for CLK_period;

		RDIR <= '1';
		DBUS <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		PC <= X"0024";
		RDIR <= '0';
		DBUS <= (OTHERS => 'Z');
		wait for CLK_period/2;
		Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		PC <= X"0022";
		wait for CLK_period/2;
		-- T3 <= '0';
		
		RDIR <= '1';
		DBUS <= X"00FE"; -- JMP X"FE" (J: JMP J)
		wait for CLK_period/2;
		PC <= X"0024";
		DBUS <= (OTHERS => 'Z');
		RDIR <= '0';
		wait for CLK_period/2;
		Addr <= X"FFFE";
		wait for CLK_period;
		-- T2 <= '1';
		wait for CLK_period;
		-- T3 <= '1';
		wait for CLK_period/2;
		PC <= X"0022";
		wait for CLK_period/2;
		-- T3 <= '0';

      wait;
   end process;

END;
