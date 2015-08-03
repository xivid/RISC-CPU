----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:55 07/29/2015 
-- Design Name: 
-- Module Name:    EXctrl - Behavioral 
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

entity EXctrl is
    Port ( -- RST : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           T1 : in  STD_LOGIC;
           Rupdate : in  STD_LOGIC;
           Raddr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rdata : in  STD_LOGIC_VECTOR (7 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
			  R0 : out STD_LOGIC_VECTOR (7 downto 0);
			  R1 : out STD_LOGIC_VECTOR (7 downto 0);
			  R2 : out STD_LOGIC_VECTOR (7 downto 0);
			  R3 : out STD_LOGIC_VECTOR (7 downto 0);
			  R4 : out STD_LOGIC_VECTOR (7 downto 0);
			  R5 : out STD_LOGIC_VECTOR (7 downto 0);
			  R6 : out STD_LOGIC_VECTOR (7 downto 0);
			  R7 : out STD_LOGIC_VECTOR (7 downto 0);
           Addr : out  STD_LOGIC_VECTOR (15 downto 0) := X"0000";
           ALUOUT : out  STD_LOGIC_VECTOR (7 downto 0) := X"00");
end EXctrl;

architecture Behavioral of EXctrl is
	type REGARR is array(7 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal Reg : REGARR := (X"77", X"66", X"55", X"44", X"33", X"22", X"11", X"00");
	signal A, B : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal Cy : STD_LOGIC := '0';
begin
	
	R0 <= Reg(0);
	R1 <= Reg(1);
	R2 <= Reg(2);
	R3 <= Reg(3);
	R4 <= Reg(4);
	R5 <= Reg(5);
	R6 <= Reg(6);
	R7 <= Reg(7);
	
	-- Prepare A, B, Addr
	process (T1, IR)
	begin
		if T1'event and T1 = '1' then
			A <= Reg(conv_integer(IR(10 downto 8)));
			B <= Reg(conv_integer(IR(2 downto 0)));
			Addr(7 downto 0) <= IR(7 downto 0);
			if IR(15 downto 11) = "00010" then  -- JZ
				Addr(15 downto 8) <= (others => IR(7)); -- ·ûºÅÎ»À©Õ¹
			else
				Addr(15 downto 8) <= Reg(7); -- R7À©Õ¹Ñ°Ö·
			end if;
		end if;
	end process;
	
	-- Calculate at falling_edge
	process (A, B, Cy, IR, T1, CLK)
		variable result : STD_LOGIC_VECTOR(8 downto 0);
	begin
		if T1 = '1' and falling_edge(CLK) then
			--if CLK = '0' and CLK'event then
				case IR(15 downto 11) is
					when "10100" => Cy <= '0'; -- CLRC(A)
					when "10110" => Cy <= '1'; -- SETC(B)
					when "00110" => result := (A(7)&A) + (B(7)&B) + Cy; -- ADC(3)
										 ALUOUT <= result(7 downto 0);
										 Cy <= result(8) xor result(7); -- Ë«·ûºÅÎ»ÅÐ¶ÏÒç³ö
					when "00100" => result := (A(7)&A) - (B(7)&B) - Cy; -- SBB(2)
										 ALUOUT <= result(7 downto 0);
										 Cy <= result(8) xor result(7);
					when "01000" => ALUOUT <= IR(7 downto 0); -- MVI(4)
					when "01010" => ALUOUT <= B; -- MOV(5)
					when "01100" => ALUOUT <= A; -- STA(6)
					when "00010" => ALUOUT <= A; -- JZ(1)
					when "10010" => ALUOUT <= A; -- OUT(9)
					when others  => null;
				end case;
			--end if;
		end if;
	end process;
	
	-- Writeback reg
	process (Rupdate, Raddr, Rdata)
	begin
		if Rupdate'event and Rupdate = '1' then
			Reg(conv_integer(Raddr)) <= Rdata;
		end if;
	end process;
end Behavioral;

