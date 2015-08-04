----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:17 07/30/2015 
-- Design Name: 
-- Module Name:    WBctrl - Behavioral 
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

entity WBctrl is
    Port (  CLK : in std_logic;
            RST : in  STD_LOGIC;
            Rtemp : in  STD_LOGIC_VECTOR (7 downto 0);
            PC : in  STD_LOGIC_VECTOR (15 downto 0);
            Addr : in  STD_LOGIC_VECTOR (15 downto 0);
            ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
            T3 : in  STD_LOGIC;
            OP : in STD_LOGIC_VECTOR (15 downto 11); -- IR(15 downto 11)
            AD1 : in STD_LOGIC_VECTOR (10 downto 8); -- IR(10 downto 8)
            nextService : in std_logic;
            intServicePort : in integer;
            returnAddr : in std_logic_vector (15 downto 0);
            Raddr : out  STD_LOGIC_VECTOR (2 downto 0);
            Rdata : out  STD_LOGIC_VECTOR (7 downto 0);
            Rupdate : out  STD_LOGIC;
            PCnew : out  STD_LOGIC_VECTOR (15 downto 0);
            entered : out std_logic;
            inctop : out std_logic;
            dectop : out std_logic);
end WBctrl;

architecture Behavioral of WBctrl is
begin
	-- 提供回写内容
	Rdata <= Rtemp when (OP = "10000" or OP = "01110" or OP = "11110") else -- IN / LDA / popr
			 ALUOUT;
	Raddr <= AD1;
    process (RST, OP, ALUOUT, T3)
    begin
        if RST = '1' then
            PCnew <= X"0010";
        elsif T3 = '1' and T3'event then
            if OP = "00000" then
                PCnew <= Addr;
            elsif (OP = "00010" and ALUOUT = X"00") then
                PCnew <= PC + Addr + 2;
            elsif (OP = "11000" and nextService = '1') then -- int
                PCnew <= Addr;
            elsif OP = "11010" then -- iret
                PCnew <= returnAddr;
            else
                PCnew <= PC + 2;
            end if;
        end if;
    end process;
	
	-- 回写控制信号
    entered <= '1' when (T3 = '1' and clk = '0' and OP = "11000") else '0'; -- int
    inctop <= '1' when (T3 = '1' and (OP = "11000" or OP = "11100" or OP = "11010" or OP = "11110")) else '0'; -- int, push, iret, pop
    dectop <= '1' when (T3 = '1' and (OP = "11010" or OP = "11110")) else '0'; -- 
	Rupdate <= '1' when (T3 = '1' and (OP = "10000" or OP = "01110" or OP = "00110" or OP = "00100" or OP = "01010" or OP = "01000" or OP = "11110")) else '0'; -- IN, LDA, ADC, SBB, MVI, MOV, popr
end Behavioral;

