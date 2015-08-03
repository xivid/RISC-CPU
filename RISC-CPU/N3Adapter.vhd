----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:57 08/01/2015 
-- Design Name: 
-- Module Name:    N3Adapter - Behavioral 
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

entity N3Adapter is
    Port ( CLK: in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           btnr : in  STD_LOGIC;
           btns : in  STD_LOGIC;
           btnu : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
           --signal on connector JA 
           JA:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
           -- signal on connector JB
           --JB(4)register selection pin  (RS)
           --JB(5)selects between read/write modes (RW)
           --JB(6)enable signal for starting the data read/write (E)
           JB:	out std_logic_vector (6 downto 4);
           MemOE : out  STD_LOGIC;
           MemWR : out  STD_LOGIC;
           MemAdv : out  STD_LOGIC;
           MemWait : out  STD_LOGIC;
           MemClk : out  STD_LOGIC;
           RamCS : out  STD_LOGIC;
           RamCRE : out  STD_LOGIC;
           RamUB : out  STD_LOGIC;
           RamLB : out  STD_LOGIC;
           MemAdr : out  STD_LOGIC_VECTOR (26 downto 1);
           MemDB : inout  STD_LOGIC_VECTOR (15 downto 0));
end N3Adapter;

architecture Behavioral of N3Adapter is
------------------------------------------------------------------
--  Component Declarations
------------------------------------------------------------------
    component CPU
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
    end component;
    
	 component IntCtrl
	 port(
		intr: in std_logic_vector(7 downto 0);
		newImr: std_logic_vector(7 downto 0);
		intServicePort: out integer;
		eint: in std_logic
		);
	end component;
	 
------------------------------------------------------------------
--  Local Type Declarations
-----------------------------------------------------------------

--  For CPU
    signal IR : STD_LOGIC_VECTOR (15 downto 0);
    signal PC : STD_LOGIC_VECTOR (15 downto 0);
    signal R0 : STD_LOGIC_VECTOR (7 downto 0);
    signal R1 : STD_LOGIC_VECTOR (7 downto 0);
    signal R2 : STD_LOGIC_VECTOR (7 downto 0);
    signal R3 : STD_LOGIC_VECTOR (7 downto 0);
    signal R4 : STD_LOGIC_VECTOR (7 downto 0);
    signal R5 : STD_LOGIC_VECTOR (7 downto 0);
    signal R6 : STD_LOGIC_VECTOR (7 downto 0);
    signal R7 : STD_LOGIC_VECTOR (7 downto 0);
    signal ABUS :  STD_LOGIC_VECTOR (15 downto 0);
    signal nRD : STD_LOGIC;
    signal nWR : STD_LOGIC;
--  Symbolic names for all possible states of the state machines.

	--LCD control state machine
	type mstate is (					  
		stFunctionSet,		 				--Initialization states
		stDisplayCtrlSet,
		stDisplayClear,
		stPowerOn_Delay,  				--Delay states
		stFunctionSet_Delay,
		stDisplayCtrlSet_Delay, 	
		stDisplayClear_Delay,
		stInitDne,							--Display characters and perform standard operations
		stActWr,
		stCharDelay							--Write delay for operations
	);
------------------------------------------------------------------
--  Signal Declarations and Constants for PmodCLP
------------------------------------------------------------------
	--These constants are used to initialize the LCD pannel.

	--FunctionSet:
		--Bit 0 and 1 are arbitrary
		--Bit 2:  Displays font type(0=5x8, 1=5x11)
		--Bit 3:  Numbers of display lines (0=1, 1=2)
		--Bit 4:  Data length (0=4 bit, 1=8 bit)
		--Bit 5-7 are set
	--DisplayCtrlSet:
		--Bit 0:  Blinking cursor control (0=off, 1=on)
		--Bit 1:  Cursor (0=off, 1=on)
		--Bit 2:  Display (0=off, 1=on)
		--Bit 3-7 are set
	--DisplayClear:
		--Bit 1-7 are set	
		
	signal clkCount:	std_logic_vector (6 downto 0);
	signal count:		std_logic_vector (20 downto 0):= "000000000000000000000";	--21 bit count variable for timing delays
	signal delayOK:	    std_logic:= '0';							--High when count has reached the right delay time
	signal OneUSClk:	std_logic;									--Signal is treated as a 1 MHz clock	
	signal stCur:		mstate:= stPowerOn_Delay;				--LCD control state machine
	signal stNext:		mstate;			  	
	signal writeDone:	std_logic:= '0';							--Command set finish

	type LCD_CMDS_T is array(0 to 37) of std_logic_vector(9 downto 0);
	signal LCD_CMDS : LCD_CMDS_T := ( 0 => "00"&X"3C",			--Function Set
					    1 => "00"&X"0C",				--Display ON, Cursor OFF, Blink OFF
					    2 => "00"&X"01",				--Clear Display
					    3 => "00"&X"02", 			--return home
                        4 => "10"&X"20", --blank
                        5 => "10"&X"20",
                        6 => "10"&X"20", 
                        7 => "10"&X"20", 
                        8 => "10"&X"20", 
                        9 => "10"&X"20", 
                        10 => "10"&X"20", 
                        11 => "10"&X"20", 
                        12 => "10"&X"20", 
                        13 => "10"&X"20", 
                        14 => "10"&X"20", 
                        15 => "10"&X"20",
                        16 => "10"&X"20",
                        17 => "10"&X"20",
                        18 => "10"&X"20",
                        19 => "10"&X"20",

                        20 => "00"&X"C0",           --Set DDRAM location to 40H (second row)                         
                                            
                        21 => "10"&X"20",
                        22 => "10"&X"20",
                        23 => "10"&X"20",
                        24 => "10"&X"20",
                        25 => "10"&X"20",
                        26 => "10"&X"20",
                        27 => "10"&X"20",
                        28 => "10"&X"20",
                        29 => "10"&X"20",
                        30 => "10"&X"20",
                        31 => "10"&X"20",
                        32 => "10"&X"20",
                        33 => "10"&X"20",
                        34 => "10"&X"20",
                        35 => "10"&X"20",
                        36 => "10"&X"20",
                        37 => "00"&X"02");          --return home					
    signal lcd_cmd_ptr : integer range 0 to LCD_CMDS'HIGH + 1 := 0;

	-- led display control
    signal T : std_logic_vector(3 downto 0);
	signal fpclock : STD_LOGIC;
    signal js : std_logic_vector(15 downto 0):= (others => '0');
	signal shift : STD_LOGIC_VECTOR(3 downto 0) :="0111";
	signal digit1, digit2, digit3, digit4 : STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	
    -- convert 4-bit data into Hexadecimal 7-seg display character
	function conv_seg(X : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
	begin
		case X is
			when "0000" => return "1000000"; -- 0
			when "0001" => return "1111001";
			when "0010" => return "0100100";
			when "0011" => return "0110000";
			when "0100" => return "0011001";
			when "0101" => return "0010010";
			when "0110" => return "0000010";
			when "0111" => return "1111000";
			when "1000" => return "0000000";
			when "1001" => return "0010000"; -- 9
			when "1010" => return "0001000"; -- A
			when "1011" => return "0000011"; -- b
			when "1100" => return "1000110"; -- C
			when "1101" => return "0100001"; -- d
			when "1110" => return "0000110"; -- E
			when "1111" => return "0001110"; -- F
			when others => return "1111111";
		end case;
	end conv_seg;
	
    -- convert 4-bit data into Hexadecimal ascii display character
	function conv_ascii(X : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
	begin
		case X is
            when "0000" => return X"30"; -- 0
            when "0001" => return X"31";
            when "0010" => return X"32";
            when "0011" => return X"33";
            when "0100" => return X"34";
            when "0101" => return X"35";
            when "0110" => return X"36";
            when "0111" => return X"37";
            when "1000" => return X"38";
            when "1001" => return X"39"; -- 9
            when "1010" => return X"41"; -- A
            when "1011" => return X"42"; -- b
            when "1100" => return X"43"; -- C
            when "1101" => return X"44"; -- d
            when "1110" => return X"45"; -- E
            when "1111" => return X"46"; -- F
            when others => return X"58"; -- X
		end case;
	end conv_ascii;
    
    -- This signals are for IO controller.
    signal IODB : std_logic_vector(7 downto 0);
    signal IOAD : std_logic_vector(1 downto 0);
    signal nPREQ, nPRD, nPWR : std_logic;
begin
    comCPU: CPU port map(
               RST => btns,
               CLK => btnr,
               DBUS => MemDB,
               IODB => IODB,
               ABUS => ABUS,
               IOAD => IOAD,
               nMREQ => RamCS,
               nPREQ => nPREQ,
               nRD => MemOE,
               nWR => MemWR,
               nBHE => RamUB,
               nBLE => RamLB,
               nPRD => nPRD,
               nPWR => nPWR,
               IR => IR,
               PC => PC,
               R0 => R0,
               R1 => R1,
               R2 => R2,
               R3 => R3,
               R4 => R4,
               R5 => R5,
               R6 => R6,
               R7 => R7,
               T => T);
					
	comIntCtrl: IntCtrl port map(intr,newImr,intServicePort,eint);
	--This process counts to 100, and then resets.  It is used to divide the clock signal.
	--This makes oneUSClock peak aprox. once every 1microsecond
	process (CLK)
    	begin
		if (CLK = '1' and CLK'event) then
			if(clkCount = "0000001") then -- 修改clkCount可以调节PmodCLP屏幕刷新速度
				clkCount <= "0000000";
				oneUSClk <= not oneUSClk;
			else 
				clkCount <= clkCount + 1;
			end if;
		end if;
	end process;
	
	--This process increments the count variable unless delayOK = 1.
	process (CLK, delayOK)
		begin
			if (CLK = '1' and CLK'event) then
				if delayOK = '1' then
					count <= "000000000000000000000";
				else
					count <= count + 1;
				end if;
			end if;
		end process;

	--Determines when count has gotten to the right number, depending on the state.
	delayOK <= '1' when ((stCur = stPowerOn_Delay and count = "111101000010010000000") or 					--2000000	 	-> 20 ms  
								(stCur = stFunctionSet_Delay and count = "000000000111110100000") or				--4000 			-> 40 us
								(stCur = stDisplayCtrlSet_Delay and count = "000000000111110100000") or			--4000 			-> 40 us
								(stCur = stDisplayClear_Delay and count = "000100111000100000000") or			--160000 		-> 1.6 ms
								(stCur = stCharDelay and count = "000111111011110100000"))							--260000			-> 2.6 ms - Max Delay for character writes and shifts
					else '0';

	--writeDone goes high when all commands have been run
	writeDone <= '1' when (lcd_cmd_ptr = LCD_CMDS'HIGH) 
					else '0';
		
	--Increments the pointer so the statemachine goes through the commands
	process (lcd_cmd_ptr, oneUSClk)
   		begin
			if (oneUSClk = '1' and oneUSClk'event) then
				if ((stNext = stInitDne or stNext = stDisplayCtrlSet or stNext = stDisplayClear) and writeDone = '0') then 
					lcd_cmd_ptr <= lcd_cmd_ptr + 1;
				elsif ((stNext = stInitDne or stNext = stDisplayCtrlSet or stNext = stDisplayClear) and writeDone = '1') then
					lcd_cmd_ptr <= 4;
				elsif stCur = stPowerOn_Delay or stNext = stPowerOn_Delay then
					lcd_cmd_ptr <= 0;
				else
					lcd_cmd_ptr <= lcd_cmd_ptr;
				end if;
			end if;
		end process;
	
	--This process runs the LCD state machine
	process (oneUSClk, btnr)
		begin
			if oneUSClk = '1' and oneUSClk'Event then
				if btnr = '1' then
					stCur <= stPowerOn_Delay;
				else
					stCur <= stNext;
				end if;
			end if;
		end process;

	
	--This process generates the sequence of outputs needed to initialize and write to the LCD screen
	process (stCur, delayOK, writeDone, lcd_cmd_ptr)
		begin   
			case stCur is
				--Delays the state machine for 20ms which is needed for proper startup.
				when stPowerOn_Delay =>
					if delayOK = '1' then
						stNext <= stFunctionSet;
					else
						stNext <= stPowerOn_Delay;
					end if;
					
				--This issues the function set to the LCD as follows 
				--8 bit data length, 1 lines, font is 5x8.
				when stFunctionSet =>
					stNext <= stFunctionSet_Delay;
				
				--Gives the proper delay of 37us between the function set and
				--the display control set.
				when stFunctionSet_Delay =>
					if delayOK = '1' then
						stNext <= stDisplayCtrlSet;
					else
						stNext <= stFunctionSet_Delay;
					end if;
				
				--Issuse the display control set as follows
				--Display ON,  Cursor OFF, Blinking Cursor OFF.
				when stDisplayCtrlSet =>
					stNext <= stDisplayCtrlSet_Delay;

				--Gives the proper delay of 37us between the display control set
				--and the Display Clear command. 
				when stDisplayCtrlSet_Delay =>
					if delayOK = '1' then
						stNext <= stDisplayClear;
					else
						stNext <= stDisplayCtrlSet_Delay;
					end if;
				
				--Issues the display clear command.
				when stDisplayClear	=>
					stNext <= stDisplayClear_Delay;

				--Gives the proper delay of 1.52ms between the clear command
				--and the state where you are clear to do normal operations.
				when stDisplayClear_Delay =>
					if delayOK = '1' then
						stNext <= stInitDne;
					else
						stNext <= stDisplayClear_Delay;
					end if;
				
				--State for normal operations for displaying characters, changing the
				--Cursor position etc.
				when stInitDne =>		
					stNext <= stActWr;

				when stActWr =>		
					stNext <= stCharDelay;
					
				--Provides a max delay between instructions.
				when stCharDelay =>
					if delayOK = '1' then
						stNext <= stInitDne;
					else
						stNext <= stCharDelay;
					end if;
			end case;	
		end process;					
	
	--Generate display content according to IR and R0~R7
	process (IR, R0, R1, R2, R3, R4, R5, R6, R7)
	begin
		LCD_CMDS(4) <= "10"&X"20"; -- blank
		LCD_CMDS(5) <= "10"&X"20";
		LCD_CMDS(6) <= "10"&X"20";
		LCD_CMDS(7) <= "10"&X"20";
		LCD_CMDS(8) <= "10"&X"20";
		LCD_CMDS(9) <= "10"&X"20";
		LCD_CMDS(10) <= "10"&X"20";
		LCD_CMDS(11) <= "10"&X"20";
		LCD_CMDS(12) <= "10"&X"20";
		LCD_CMDS(13) <= "10"&X"20";
		LCD_CMDS(14) <= "10"&X"20";
		LCD_CMDS(15) <= "10"&X"20";
		LCD_CMDS(16) <= "10"&X"20";
		LCD_CMDS(17) <= "10"&X"20";
		LCD_CMDS(18) <= "10"&X"20";
		LCD_CMDS(19) <= "10"&X"20";
        LCD_CMDS(21) <= "10"&conv_ascii(R7(7 downto 4)); -- R7
        LCD_CMDS(22) <= "10"&conv_ascii(R7(3 downto 0));
        LCD_CMDS(23) <= "10"&conv_ascii(R6(7 downto 4)); -- R6
        LCD_CMDS(24) <= "10"&conv_ascii(R6(3 downto 0));
        LCD_CMDS(25) <= "10"&conv_ascii(R5(7 downto 4)); -- R5
        LCD_CMDS(26) <= "10"&conv_ascii(R5(3 downto 0));
        LCD_CMDS(27) <= "10"&conv_ascii(R4(7 downto 4)); -- R4
        LCD_CMDS(28) <= "10"&conv_ascii(R4(3 downto 0));
        LCD_CMDS(29) <= "10"&conv_ascii(R3(7 downto 4)); -- R3
        LCD_CMDS(30) <= "10"&conv_ascii(R3(3 downto 0));
        LCD_CMDS(31) <= "10"&conv_ascii(R2(7 downto 4)); -- R2
        LCD_CMDS(32) <= "10"&conv_ascii(R2(3 downto 0));
        LCD_CMDS(33) <= "10"&conv_ascii(R1(7 downto 4)); -- R1
        LCD_CMDS(34) <= "10"&conv_ascii(R1(3 downto 0));
        LCD_CMDS(35) <= "10"&conv_ascii(R0(7 downto 4)); -- R0
        LCD_CMDS(36) <= "10"&conv_ascii(R0(3 downto 0));
		case IR(15 downto 11) is
			when "00000" => -- JMP [0xff]
				LCD_CMDS(5)(7 downto 0) <= X"4a";
				LCD_CMDS(6)(7 downto 0) <= X"4d";
				LCD_CMDS(7)(7 downto 0) <= X"50";
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= X"30";
                LCD_CMDS(15)(7 downto 0) <= X"78";
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(17)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(18)(7 downto 0) <= X"5d";
			when "00010" => -- JZ Rx, [0xff]
				LCD_CMDS(6)(7 downto 0) <= X"4a";
				LCD_CMDS(7)(7 downto 0) <= X"5a";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c"; --,
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= X"30";
                LCD_CMDS(15)(7 downto 0) <= X"78";
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(17)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(18)(7 downto 0) <= X"5d";
			when "00100" => -- SBB Rx, Rx
				LCD_CMDS(5)(7 downto 0) <= X"53";
				LCD_CMDS(6)(7 downto 0) <= X"42";
				LCD_CMDS(7)(7 downto 0) <= X"42";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"52";
                LCD_CMDS(14)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "00110" => -- ADC Rx, Rx
				LCD_CMDS(5)(7 downto 0) <= X"41";
				LCD_CMDS(6)(7 downto 0) <= X"44";
				LCD_CMDS(7)(7 downto 0) <= X"43";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"52";
                LCD_CMDS(14)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "01000" => -- MVI Rx, 0xff
				LCD_CMDS(5)(7 downto 0) <= X"4d";
				LCD_CMDS(6)(7 downto 0) <= X"56";
				LCD_CMDS(7)(7 downto 0) <= X"49";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"30";
                LCD_CMDS(14)(7 downto 0) <= X"78";
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(3 downto 0));
			when "01010" => -- MOV Rx, Rx
				LCD_CMDS(5)(7 downto 0) <= X"4d";
				LCD_CMDS(6)(7 downto 0) <= X"4f";
				LCD_CMDS(7)(7 downto 0) <= X"56";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"52";
                LCD_CMDS(14)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "01100" => -- STA Rx, [0xff]
				LCD_CMDS(5)(7 downto 0) <= X"53";
				LCD_CMDS(6)(7 downto 0) <= X"54";
				LCD_CMDS(7)(7 downto 0) <= X"41";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= X"30";
                LCD_CMDS(15)(7 downto 0) <= X"78";
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(17)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(18)(7 downto 0) <= X"5d";
			when "01110" => -- LDA Rx, [0xff]
				LCD_CMDS(5)(7 downto 0) <= X"4c";
				LCD_CMDS(6)(7 downto 0) <= X"44";
				LCD_CMDS(7)(7 downto 0) <= X"41";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= X"30";
                LCD_CMDS(15)(7 downto 0) <= X"78";
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(17)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(18)(7 downto 0) <= X"5d";
			when "10000" => -- IN Rx, [00]
				LCD_CMDS(6)(7 downto 0) <= X"49";
				LCD_CMDS(7)(7 downto 0) <= X"4e";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= conv_ascii("000"&IR(1));
                LCD_CMDS(15)(7 downto 0) <= conv_ascii("000"&IR(0));
                LCD_CMDS(16)(7 downto 0) <= X"5d";
			when "10010" => -- OUT Rx, [00]
				LCD_CMDS(5)(7 downto 0) <= X"4f";
				LCD_CMDS(6)(7 downto 0) <= X"55";
				LCD_CMDS(7)(7 downto 0) <= X"54";
				LCD_CMDS(9)(7 downto 0) <= X"52";
				LCD_CMDS(10)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(11)(7 downto 0) <= X"2c";
                LCD_CMDS(13)(7 downto 0) <= X"5b";
                LCD_CMDS(14)(7 downto 0) <= conv_ascii("000"&IR(1));
                LCD_CMDS(15)(7 downto 0) <= conv_ascii("000"&IR(0));
                LCD_CMDS(16)(7 downto 0) <= X"5d";
			when "10100" => -- CLRC
				LCD_CMDS(4)(7 downto 0) <= X"43";
				LCD_CMDS(5)(7 downto 0) <= X"4c";
				LCD_CMDS(6)(7 downto 0) <= X"52";
				LCD_CMDS(7)(7 downto 0) <= X"43";
			when "10110" => -- SETC
				LCD_CMDS(4)(7 downto 0) <= X"53";
				LCD_CMDS(5)(7 downto 0) <= X"45";
				LCD_CMDS(6)(7 downto 0) <= X"54";
				LCD_CMDS(7)(7 downto 0) <= X"43";
			when others => -- Undefined.. >_<
				LCD_CMDS(4)(7 downto 0) <= X"55";
				LCD_CMDS(5)(7 downto 0) <= X"6e";
				LCD_CMDS(6)(7 downto 0) <= X"64";
				LCD_CMDS(7)(7 downto 0) <= X"65";
				LCD_CMDS(8)(7 downto 0) <= X"66";
				LCD_CMDS(9)(7 downto 0) <= X"69";
				LCD_CMDS(10)(7 downto 0) <= X"6e";
				LCD_CMDS(11)(7 downto 0) <= X"65";
				LCD_CMDS(12)(7 downto 0) <= X"64";
                LCD_CMDS(13)(7 downto 0) <= X"2e";
                LCD_CMDS(14)(7 downto 0) <= X"2e";
                LCD_CMDS(16)(7 downto 0) <= X"3e";
                LCD_CMDS(17)(7 downto 0) <= X"5f";
                LCD_CMDS(18)(7 downto 0) <= X"3c";
		end case;
        
	end process;
	
	JB(4) <= LCD_CMDS(lcd_cmd_ptr)(9);
	JB(5) <= LCD_CMDS(lcd_cmd_ptr)(8);
	JA <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
	JB(6) <= '1' when stCur = stFunctionSet or stCur = stDisplayCtrlSet or stCur = stDisplayClear or stCur = stActWr
				else '0';	

    -- Led display
    process(clk)
    begin
        if(rising_edge(clk)) then 
            js<=js+'1';
        end if;
    end process;

    fpclock <= js(15);
    
    process(fpclock) -- 7 seg display control
	begin
		if(fpclock'event and fpclock = '1') then
			shift(1)<=shift(0);
			shift(2)<=shift(1);
			shift(3)<=shift(2);
			shift(0)<=shift(3);
			an <= shift; 
			case shift is
				  when "0111" => seg <= digit1;
				  when "1011" => seg <= digit2;
				  when "1101" => seg <= digit3;
				  when others => seg <= digit4;
			end case;
		end if;
	end process;
    
    digit1 <= (not T(0))&conv_seg(IR(15 downto 12)) when btnu = '1' else (not T(0))&conv_seg(PC(15 downto 12));
	digit2 <= (not T(1))&conv_seg(IR(11 downto 8)) when btnu = '1' else (not T(1))&conv_seg(PC(11 downto 8));
	digit3 <= (not T(2))&conv_seg(IR(7 downto 4)) when btnu = '1' else (not T(2))&conv_seg(PC(7 downto 4));
	digit4 <= (not T(3))&conv_seg(IR(3 downto 0)) when btnu = '1' else (not T(3))&conv_seg(PC(3 downto 0));
	
    MemAdv <= '0';
    MemWait <= '0';
    MemClk <= '0';
    RamCRE <= '0';
    MemAdr(26 downto 16) <= (others => '0');
    MemAdr(15 downto 1) <= ABUS(15 downto 1);
    
    -- This is a IO controller adapted on Nexys3.
    -- Address -> device:
    -- 00 -> sw(7 downto 0)
    -- 01 -> sw(0 to 7)
    -- 10 -> led(7 downto 0)
    -- 11 -> led(0 to 7)
    process (IOAD, IODB, nPREQ, nPRD, nPWR, sw)
    begin
        IODB <= (others => 'Z');
        led <= (others => '0');
        if nPREQ = '0' then
            if nPRD = '0' and nPWR = '1' then
                case IOAD is
                    when "00" => IODB <= sw;
                    when "01" => 
                    rev1: for i in 7 downto 0 loop
                            IODB(i) <= sw(7-i);
                          end loop rev1;
                    when others => null;
                end case;
            elsif nPRD = '1' and nPWR = '0' then
                case IOAD is
                    when "10" => led <= IODB;
                    when "11" =>
                    rev2: for i in 7 downto 0 loop
                            led(i) <= IODB(7-i);
                          end loop rev2;
                    when others => null;
                end case;
            end if;
        end if;
    end process;
end Behavioral;

