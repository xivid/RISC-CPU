----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:55 07/30/2015 
-- Design Name: 
-- Module Name:    ACctrl - Behavioral 
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

entity ACctrl is
    Port ( nIO : in  STD_LOGIC;
           nMEM : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           WR : in  STD_LOGIC;
           RDIR : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           pushPC : in std_logic;
           popPC : in std_logic;
           RDINT : in std_logic;
           intAddr : in std_logic_vector(15 downto 0);
           pushr : in std_logic;
           popr : in std_logic;
           nBLE : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nMREQ : out  STD_LOGIC;
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           nPREQ : out  STD_LOGIC;
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           Rtemp : out  STD_LOGIC_VECTOR (7 downto 0);
           returnAddr : out STD_LOGIC_VECTOR (15 downto 0);
           serviceAddr : out std_logic_vector (15 downto 0) -- 中断服务程序入口地址
           );
end ACctrl;

architecture Behavioral of ACctrl is
	signal address : std_logic_vector (15 downto 0);
    signal stackTop : std_logic_vector (15 downto 0) := X"1000";
begin
	-- 形成访存/访IO的地址
	address <= Addr when (nMEM = '0' or nIO = '0') else
			   PC when RDIR = '1' else
               intAddr when RDINT = '1' else
               address;
	process (RDIR, RDINT, WR, RD, nIO, nMEM, DBUS, ALUOUT, IODB, address, pushPC, popPC, pushr, popr)
	begin
        nMREQ <= '1';
        nPREQ <= '1';
        ABUS <= address;
        DBUS <= (others => 'Z');
        IOAD <= address(1 downto 0);
        IODB <= (others => 'Z');
		if RDIR = '1' then
			nMREQ <= '0';
			nBLE <= '0';
			nBHE <= '0';
			nRD <= '0';
			nWR <= '1';
            ABUS <= address;
            DBUS <= (others => 'Z');
			IR <= DBUS;
        elsif RDINT = '1' then
            nMREQ <= '0';
			nBLE <= '0';
			nBHE <= '0';
			nRD <= '0';
			nWR <= '1';
            ABUS <= address;
            DBUS <= (others => 'Z');
			serviceAddr <= DBUS;
        elsif pushPC = '1' then -- 要进入下一层中断，先将PC压栈
            nMREQ <= '0';
            nBLE <= '0';
            nBHE <= '0';
            nRD <= '1';
            nWR <= '0';
            ABUS <= stackTop;
            DBUS <= PC + 2;
        elsif pushr = '1' then
            nMREQ <= '0';
            nBLE <= '0';
            nBHE <= '0';
            nRD <= '1';
            nWR <= '0';
            ABUS <= stackTop;
            DBUS <= ALUOUT&ALUOUT;
        elsif popPC = '1' then
            nMREQ <= '0';
            nBLE <= '0';
            nBHE <= '0';
            nRD <= '0';
            nWR <= '1';
            ABUS <= stackTop - 2;
            DBUS <= (others => 'Z');
            returnAddr <= DBUS;
        elsif popr = '1' then
            nMREQ <= '0';
            nBLE <= '0';
            nBHE <= '0';
            nRD <= '0';
            nWR <= '1';
            ABUS <= stackTop - 2;
            DBUS <= (others => 'Z');
            Rtemp <= DBUS(7 downto 0);
		elsif nMEM = '0' then
            nMREQ <= '0';
            ABUS <= address;
            nBLE <= address(0);
            nBHE <= not address(0);
            nRD <= not RD;
            nWR <= not WR;
            if RD = '1' and address(0) = '0' then
                DBUS <= (others => 'Z');
                Rtemp <= DBUS(7 downto 0);
            elsif RD = '1' and address(1) = '0' then
                DBUS <= (others => 'Z');
                Rtemp <= DBUS(15 downto 8);
            elsif WR = '1' then
                DBUS <= ALUOUT&ALUOUT;
            end if;
		elsif nIO = '0' then
            nPREQ <= '0';
            IOAD <= address(1 downto 0);
            nPRD <= not RD;
            nPWR <= not WR;
            if RD = '1' then
                IODB <= (others => 'Z');
                Rtemp <= IODB;
            elsif WR = '1' then
                IODB <= ALUOUT;
            end if;
		end if;
        if pushPC'event and pushPC = '0' then --下降沿
            stackTop <= stackTop + 2;
        end if;
        if pushr'event and pushr = '0' then
            stackTop <= stackTop + 2;
        end if;
        if popr'event and popr = '0' then
            stackTop <= stackTop - 2;
        end if;
        if popPC'event and popPC = '0' then
            stackTop <= stackTop - 2;
        end if;
	end process;
	
	
end Behavioral;

