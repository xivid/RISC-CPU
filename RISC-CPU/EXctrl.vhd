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
    Port (  CLK : in STD_LOGIC;
            T1 : in  STD_LOGIC;
            Rupdate : in  STD_LOGIC;
            Raddr : in  STD_LOGIC_VECTOR (2 downto 0);
            Rdata : in  STD_LOGIC_VECTOR (7 downto 0);
            IR : in  STD_LOGIC_VECTOR (15 downto 0);
            serviceAddr : in std_logic_vector (15 downto 0); -- 中断服务程序入口地址
            Cout : out std_logic;
            R0 : out STD_LOGIC_VECTOR (7 downto 0);
            R1 : out STD_LOGIC_VECTOR (7 downto 0);
            R2 : out STD_LOGIC_VECTOR (7 downto 0);
            R3 : out STD_LOGIC_VECTOR (7 downto 0);
            R4 : out STD_LOGIC_VECTOR (7 downto 0);
            R5 : out STD_LOGIC_VECTOR (7 downto 0);
            R6 : out STD_LOGIC_VECTOR (7 downto 0);
            R7 : out STD_LOGIC_VECTOR (7 downto 0);
            Addr : out  STD_LOGIC_VECTOR (15 downto 0) := X"0000";
            ALUOUT : out  STD_LOGIC_VECTOR (7 downto 0) := X"00";
            intr : out std_logic_vector (7 downto 0);
            intrUpdate : out std_logic;
            isrUpdate : out std_logic;
            RDINT : out std_logic;
            intAddr : out std_logic_vector(15 downto 0) -- 中断向量
         );
end EXctrl;

architecture Behavioral of EXctrl is
	type REGARR is array(7 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal Reg : REGARR := (X"77", X"66", X"55", X"44", X"33", X"22", X"11", X"00");
	signal A, B : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal Cy : STD_LOGIC := '0';
begin
	Cout <= Cy;
	R0 <= Reg(0);
	R1 <= Reg(1);
	R2 <= Reg(2);
	R3 <= Reg(3);
	R4 <= Reg(4);
	R5 <= Reg(5);
	R6 <= Reg(6);
	R7 <= Reg(7);
	
	-- Prepare A, B, Addr
	process (T1, IR, CLK)
	begin
		if T1 = '1' and CLK = '1' then
			A <= Reg(conv_integer(IR(10 downto 8)));
			B <= Reg(conv_integer(IR(2 downto 0)));
			Addr(7 downto 0) <= IR(7 downto 0);
			if IR(15 downto 11) = "00010" then  -- JZ
				Addr(15 downto 8) <= (others => IR(7)); -- 符号位扩展
            elsif IR(15 downto 11) = "11000" then -- INT
                RDINT <= '1'; -- 向访存模块送中断向量，获取中断服务程序入口地址
                intAddr <= X"000"&IR(2 downto 0)&'0';
                Addr <= serviceAddr;
			else
				Addr(15 downto 8) <= Reg(7); -- R7扩展寻址
			end if;
		end if;
	end process;
	
	-- Calculate at falling_edge
	process (A, B, Cy, IR, T1, CLK)
		variable result : STD_LOGIC_VECTOR(8 downto 0);
	begin
		if T1 = '1' and falling_edge(CLK) then
            case IR(15 downto 11) is
                when "10100" => Cy <= '0'; -- CLRC(A)
                when "10110" => Cy <= '1'; -- SETC(B)
                when "00110" => result := (A(7)&A) + (B(7)&B) + Cy; -- ADC(3)
                                ALUOUT <= result(7 downto 0);
                                Cy <= result(8); -- 第8位判断溢出
                when "00100" => result := (A(7)&A) - (B(7)&B) - Cy; -- SBB(2)
                                ALUOUT <= result(7 downto 0);
                                Cy <= result(8);
                when "01000" => ALUOUT <= IR(7 downto 0); -- MVI(4)
                when "01010" => ALUOUT <= B; -- MOV(5)
                when "01100" => ALUOUT <= A; -- STA(6)
                when "00010" => ALUOUT <= A; -- JZ(1)
                when "10010" => ALUOUT <= A; -- OUT(9)
                when "11100" => ALUOUT <= A; -- pushr(E)
                when others  => null;
            end case;
		end if;
	end process;
	
	-- Writeback reg
	process (Rupdate, Raddr, Rdata)
	begin
		if Rupdate'event and Rupdate = '1' then
			Reg(conv_integer(Raddr)) <= Rdata;
		end if;
	end process;
    
    -- int
    process (T1, IR)
    begin
        intr <= (others => '0');
        intrUpdate <= '0';
        isrUpdate <= '0';
        if T1 = '1' then
            if IR(15 downto 11) = "11000" then
                intr(conv_integer(IR(2 downto 0))) <= '1';
                intrUpdate <= '1';
            elsif IR(15 downto 11) = "11010" then
                isrUpdate <= '1';
            end if;
        end if;
    end process;
    
end Behavioral;

