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
    Port ( --RST : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           Rtemp : in  STD_LOGIC_VECTOR (7 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           T3 : in  STD_LOGIC;
			  OP : in STD_LOGIC_VECTOR (15 downto 11); -- IR(15 downto 11)
			  AD1 : in STD_LOGIC_VECTOR (10 downto 8); -- IR(10 downto 8)
           Raddr : out  STD_LOGIC_VECTOR (2 downto 0);
           Rdata : out  STD_LOGIC_VECTOR (7 downto 0);
           Rupdate : out  STD_LOGIC;
           PCnew : out  STD_LOGIC_VECTOR (15 downto 0);
           PCupdate : out  STD_LOGIC;
			  newImr: out std_logic_vector(7 downto 0);
			  PCandImrReady: out std_logic;
			  fetchImr: in std_logic;
			  imrFetched: out std_logic;
			  nextService: in std_logic;
			  IR: in std_logic_vector(15 downto 0);
			  returnAddr: in std_logic_vector(15 downto 0)
			  );
end WBctrl;

architecture Behavioral of WBctrl is	
	--signal JMP, JZ : std_logic;
begin
	-- 提供回写内容
	Rdata <= Rtemp when (OP = "10000" or OP = "01110") else -- IN / LDA
				ALUOUT;
	Raddr <= AD1;
	PCnew <= PC + Addr when (OP = "00010" and rising_edge(CLK)) else
             Addr when (OP = "00000" and rising_edge(CLK)) else
				 "10001000" & conv_std_logic_vector(conv_integer(IR(2 downto 0))*20,8) when (OP = "11000" and nextService = '1' and rising_edge(CLK) and T3='1') 
				 else returnAddr when (OP="11111" and rising_edge(CLK) and T3='1')
				 else PC;
	-- writeBack new imr
	newImr <= Rtemp when (OP = "11000" and T3='1' and fetchImr = '1');
	imrFetched <= '1' when (OP = "11000" and T3='1' and fetchImr = '1') else '0';
	-- 回写控制信号
	--JMP <= '1' when OP = "00000" else '0';
	--JZ  <= '1' when OP = "00010" and ALUOUT = x"00" else '0';
	PCupdate <= (T3 and CLK) when ((OP = "00000" or (OP = "00010" and ALUOUT = X"00") or (OP = "11000" and nextService = '1')) or OP="11111") else '0';
	Rupdate <= (T3 and CLK) when (OP = "10000" or OP = "01110" or OP = "00110" or OP = "00100" or OP = "01010" or OP = "01000") else '0'; -- IN, LDA, ADC, SBB, MVI, MOV
end Behavioral;

