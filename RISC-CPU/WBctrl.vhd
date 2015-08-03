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
    Port (  RST : in  STD_LOGIC;
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
            pushPC : out std_logic;
            PCnew : out  STD_LOGIC_VECTOR (15 downto 0));
end WBctrl;

architecture Behavioral of WBctrl is
begin
	-- 提供回写内容
	Rdata <= Rtemp when (OP = "10000" or OP = "01110") else -- IN / LDA
				ALUOUT;
	Raddr <= AD1;
    process (RST, OP, ALUOUT, T3)
    begin
        if RST = '1' then
            PCnew <= X"0000";
        elsif T3 = '1' and T3'event then
            if OP = "00000" then
                PCnew <= Addr;
            elsif (OP = "00010" and ALUOUT = X"00") then
                PCnew <= PC + Addr + 2;
            elsif (OP = "11000" and nextService = '1') then
                PCnew <= conv_std_logic_vector(intServicePort*2, 16);
            elsif OP = "11010" then
                PCnew <= returnAddr;
            else
                PCnew <= PC + 2;
            end if;
        end if;
    end process;
	
	-- 回写控制信号
    pushPC <= '1' when (T3 = '1' and OP = "11000" and nextService = '1') else '0';
	Rupdate <= '1' when (T3 = '1' and (OP = "10000" or OP = "01110" or OP = "00110" or OP = "00100" or OP = "01010" or OP = "01000")) else '0'; -- IN, LDA, ADC, SBB, MVI, MOV
end Behavioral;

