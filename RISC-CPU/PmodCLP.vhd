----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:14 08/02/2015 
-- Design Name: 
-- Module Name:    PmodCLP - Behavioral 
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

entity PmodCLP is
    Port ( 	RESET:	in std_logic;									--use RESET as reset input
			clk:	in std_logic;									--100 MHz clock input
			IR:     in std_logic_vector(15 downto 0);
            R0:     in std_logic_vector(7 downto 0);
            R1:     in std_logic_vector(7 downto 0);
            R2:     in std_logic_vector(7 downto 0);
            R3:     in std_logic_vector(7 downto 0);
            R4:     in std_logic_vector(7 downto 0);
            R5:     in std_logic_vector(7 downto 0);
            R6:     in std_logic_vector(7 downto 0);
            R7:     in std_logic_vector(7 downto 0);
			--lcd input signals
			--signal on connector JA 
			JA:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
            -- signal on connector JB
                --JB(4)register selection pin  (RS)
                --JB(5)selects between read/write modes (RW)
                --JB(6)enable signal for starting the data read/write (E)
            JB:	out std_logic_vector (6 downto 4)  
			);		
end PmodCLP;

architecture Behavioral of PmodCLP is
------------------------------------------------------------------
--  Local Type Declarations
-----------------------------------------------------------------

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
    
begin
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
	process (oneUSClk, RESET)
		begin
			if oneUSClk = '1' and oneUSClk'Event then
				if RESET = '1' then
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
        LCD_CMDS(21) <= "10"&conv_ascii(R0(7 downto 4)); -- R0
        LCD_CMDS(22) <= "10"&conv_ascii(R0(3 downto 0));
        LCD_CMDS(23) <= "10"&conv_ascii(R1(7 downto 4)); -- R1
        LCD_CMDS(24) <= "10"&conv_ascii(R1(3 downto 0));
        LCD_CMDS(25) <= "10"&conv_ascii(R2(7 downto 4)); -- R2
        LCD_CMDS(26) <= "10"&conv_ascii(R2(3 downto 0));
        LCD_CMDS(27) <= "10"&conv_ascii(R3(7 downto 4)); -- R3
        LCD_CMDS(28) <= "10"&conv_ascii(R3(3 downto 0));
        LCD_CMDS(29) <= "10"&conv_ascii(R4(7 downto 4)); -- R4
        LCD_CMDS(30) <= "10"&conv_ascii(R4(3 downto 0));
        LCD_CMDS(31) <= "10"&conv_ascii(R5(7 downto 4)); -- R5
        LCD_CMDS(32) <= "10"&conv_ascii(R5(3 downto 0));
        LCD_CMDS(33) <= "10"&conv_ascii(R6(7 downto 4)); -- R6
        LCD_CMDS(34) <= "10"&conv_ascii(R6(3 downto 0));
        LCD_CMDS(35) <= "10"&conv_ascii(R7(7 downto 4)); -- R7
        LCD_CMDS(36) <= "10"&conv_ascii(R7(3 downto 0));
		case IR(15 downto 11) is
			when "00000" => -- JMP [R7//0xff]
				LCD_CMDS(4)(7 downto 0) <= X"4a";
				LCD_CMDS(5)(7 downto 0) <= X"4d";
				LCD_CMDS(6)(7 downto 0) <= X"50";
                
                LCD_CMDS(8)(7 downto 0) <= X"5b"; -- [
				LCD_CMDS(9)(7 downto 0) <= conv_ascii(R7(7 downto 4)); -- R7
				LCD_CMDS(10)(7 downto 0) <= conv_ascii(R7(3 downto 0)); -- R7
				LCD_CMDS(11)(7 downto 0) <= X"2f"; -- /
                LCD_CMDS(12)(7 downto 0) <= X"2f"; -- /
                LCD_CMDS(13)(7 downto 0) <= X"30"; -- 0
                LCD_CMDS(14)(7 downto 0) <= X"78"; -- x
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(17)(7 downto 0) <= X"5d";
			when "00010" => -- JZ Rx, 0xffff
				LCD_CMDS(4)(7 downto 0) <= X"4a";
				LCD_CMDS(5)(7 downto 0) <= X"5a";
                
				LCD_CMDS(7)(7 downto 0) <= X"52";
				LCD_CMDS(8)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(9)(7 downto 0) <= X"2c"; -- ,
                
                LCD_CMDS(11)(7 downto 0) <= X"30"; -- 0
                LCD_CMDS(12)(7 downto 0) <= X"78"; -- x
                LCD_CMDS(13)(7 downto 0) <= conv_ascii(IR(7)&IR(7)&IR(7)&IR(7)); -- sign
                LCD_CMDS(14)(7 downto 0) <= conv_ascii(IR(7)&IR(7)&IR(7)&IR(7)); -- sign
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(3 downto 0));
			when "00100" => -- SBB Rx, Rx
				LCD_CMDS(4)(7 downto 0) <= X"53";
				LCD_CMDS(5)(7 downto 0) <= X"42";
				LCD_CMDS(6)(7 downto 0) <= X"42";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"52";
                LCD_CMDS(13)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "00110" => -- ADC Rx, Rx
				LCD_CMDS(4)(7 downto 0) <= X"41";
				LCD_CMDS(5)(7 downto 0) <= X"44";
				LCD_CMDS(6)(7 downto 0) <= X"43";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"52";
                LCD_CMDS(13)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "01000" => -- MVI Rx, 0xff
				LCD_CMDS(4)(7 downto 0) <= X"4d";
				LCD_CMDS(5)(7 downto 0) <= X"56";
				LCD_CMDS(6)(7 downto 0) <= X"49";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"30";
                LCD_CMDS(13)(7 downto 0) <= X"78";
                LCD_CMDS(14)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(3 downto 0));
			when "01010" => -- MOV Rx, Rx
				LCD_CMDS(4)(7 downto 0) <= X"4d";
				LCD_CMDS(5)(7 downto 0) <= X"4f";
				LCD_CMDS(6)(7 downto 0) <= X"56";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"52";
                LCD_CMDS(13)(7 downto 0) <= "00110"&IR(2 downto 0);
			when "01100" => -- STA Rx, [0xff]
				LCD_CMDS(4)(7 downto 0) <= X"53";
				LCD_CMDS(5)(7 downto 0) <= X"54";
				LCD_CMDS(6)(7 downto 0) <= X"41";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"5b";
                LCD_CMDS(13)(7 downto 0) <= X"30";
                LCD_CMDS(14)(7 downto 0) <= X"78";
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(17)(7 downto 0) <= X"5d";
			when "01110" => -- LDA Rx, [0xff]
				LCD_CMDS(4)(7 downto 0) <= X"4c";
				LCD_CMDS(5)(7 downto 0) <= X"44";
				LCD_CMDS(6)(7 downto 0) <= X"41";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"5b";
                LCD_CMDS(13)(7 downto 0) <= X"30";
                LCD_CMDS(14)(7 downto 0) <= X"78";
                LCD_CMDS(15)(7 downto 0) <= conv_ascii(IR(7 downto 4));
                LCD_CMDS(16)(7 downto 0) <= conv_ascii(IR(3 downto 0));
                LCD_CMDS(17)(7 downto 0) <= X"5d";
			when "10000" => -- IN Rx, [00]
				LCD_CMDS(4)(7 downto 0) <= X"49";
				LCD_CMDS(5)(7 downto 0) <= X"4e";
                
				LCD_CMDS(7)(7 downto 0) <= X"52";
				LCD_CMDS(8)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(9)(7 downto 0) <= X"2c";
                
                LCD_CMDS(11)(7 downto 0) <= X"5b";
                LCD_CMDS(12)(7 downto 0) <= conv_ascii("000"&IR(1));
                LCD_CMDS(13)(7 downto 0) <= conv_ascii("000"&IR(0));
                LCD_CMDS(14)(7 downto 0) <= X"5d";
			when "10010" => -- OUT Rx, [00]
				LCD_CMDS(4)(7 downto 0) <= X"4f";
				LCD_CMDS(5)(7 downto 0) <= X"55";
				LCD_CMDS(6)(7 downto 0) <= X"54";
                
				LCD_CMDS(8)(7 downto 0) <= X"52";
				LCD_CMDS(9)(7 downto 0) <= "00110"&IR(10 downto 8);
				LCD_CMDS(10)(7 downto 0) <= X"2c";
                
                LCD_CMDS(12)(7 downto 0) <= X"5b";
                LCD_CMDS(13)(7 downto 0) <= conv_ascii("000"&IR(1));
                LCD_CMDS(14)(7 downto 0) <= conv_ascii("000"&IR(0));
                LCD_CMDS(15)(7 downto 0) <= X"5d";
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
			when others => -- Undefined... >_<
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
end Behavioral;

