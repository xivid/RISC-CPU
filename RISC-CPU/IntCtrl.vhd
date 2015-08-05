----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:46 08/02/2015 
-- Design Name: 
-- Module Name:    IntCtrl - Behavioral 
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

entity INTctrl is
    port(
        intr: in std_logic_vector(7 downto 0);
        newImr: in std_logic_vector(7 downto 0);
        intrUpdate: in std_logic;
        imrUpdate: in std_logic;
        isrUpdate: in std_logic;
        entered : in std_logic;
        nextService: out std_logic; -- 告诉CPU可以进入
        intServicePort: out integer;
        nowimr: out std_logic_vector(7 downto 0)
    );
end INTctrl;

architecture Behavioral of INTctrl is
	-- signal irr: std_logic_vector(7 downto 0):= "00000000"; -- 待响应的序号
	signal isr: std_logic_vector(7 downto 0):= "00000000"; -- 所有正在执行的中断服务程序
	signal imr: std_logic_vector(7 downto 0):= "10000000"; -- 屏蔽字
    type stackType is array(0 to 8) of integer;
    signal PortStack : stackType := (8, 0, 0, 0, 0, 0, 0, 0, 0);
    signal stackTop, nextTop : integer := 0;
    signal nextServicePort, runningPort : integer := 8;
begin
	intServicePort <= runningPort;
    nowimr <= imr;
    imr <= newImr when imrUpdate = '1' else imr;
	
    process(intrUpdate, entered, isrUpdate, intr, isr, imr)
    begin
        if intrUpdate = '1' and intrUpdate'event then
            if intr(0) = '1' and imr(0) = '0' then
                nextService <= '1';
                nextServicePort <= 0;
                nextTop <= stackTop + 1;
            elsif intr(1) = '1' and imr(1) = '0' then
                nextService <= '1';
                nextServicePort <= 1;
                nextTop <= stackTop + 1;
            elsif intr(2) = '1' and imr(2) = '0' then
                nextService <= '1';
                nextServicePort <= 2;
                nextTop <= stackTop + 1;
            elsif intr(3) = '1' and imr(3) = '0' then
                nextService <= '1';
                nextServicePort <= 3;
                nextTop <= stackTop + 1;
            elsif intr(4) = '1' and imr(4) = '0' then
                nextService <= '1';
                nextServicePort <= 4;
                nextTop <= stackTop + 1;
            elsif intr(5) = '1' and imr(5) = '0' then
                nextService <= '1';
                nextServicePort <= 5;
                nextTop <= stackTop + 1;
            elsif intr(6) = '1' and imr(6) = '0' then
                nextService <= '1';
                nextServicePort <= 6;
                nextTop <= stackTop + 1;
            elsif intr(7) = '1' and imr(7) = '0' then
                nextService <= '1';
                nextServicePort <= 7;
                nextTop <= stackTop + 1;
            else
                nextService <= '0';
                nextTop <= stackTop;
            end if;
        end if;
        if entered = '1' then
            nextService <= '0';
            runningPort <= nextServicePort;
            isr(nextServicePort) <= '1';
            PortStack(nextTop) <= nextServicePort;
            stackTop <= nextTop;
        elsif isrUpdate = '1' and isrUpdate'event then
            isr(runningPort) <= '0';
            stackTop <= stackTop - 1;
            runningPort <= PortStack(stackTop);
            nextServicePort <= PortStack(stackTop);
        end if;
    end process;

end Behavioral;