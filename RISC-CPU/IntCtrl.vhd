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
        nextService: out std_logic;
        intServicePort: out integer;
        nowimr: out std_logic_vector(7 downto 0)
    );
end INTctrl;

architecture Behavioral of INTctrl is
	signal irr: std_logic_vector(7 downto 0):= "00000000"; -- 待响应的序号
	signal isr: std_logic_vector(7 downto 0):= "00000000"; -- 尚未执行完毕的中断服务程序
	signal imr: std_logic_vector(7 downto 0):= "00000000"; -- 屏蔽字
    type stackType is array(0 to 8) of integer;
    signal PortStack : stackType := (8, 0, 0, 0, 0, 0, 0, 0, 0);
    signal stackTop : integer := 0;
    signal pushStack, popStack : std_logic := '0';
    signal runningPort : integer := 8;
begin
	intServicePort <= runningPort;
    nowimr <= imr;
	process(intrUpdate, isrUpdate, runningPort, irr, isr, intr, imr, entered, pushStack, popStack)
	begin
		if intrUpdate='1' and intrUpdate'event then
			setIRR: for servicePort in 0 to 7 loop
                if imr(servicePort) = '1' then
                    irr(servicePort) <= '0';
                else
                    irr(servicePort) <= intr(servicePort);
                end if;
			end loop;
        end if;
        if conv_integer(irr)/=0 then
            nextService <= '0';
            getNextInt: for servicePort in 0 to 7 loop
                if (irr(servicePort) and (not isr(servicePort)))='1' then
                    isr(servicePort) <= '1';
                    irr(servicePort) <= '0';
                    runningPort <= servicePort;
                    PortStack(stackTop + 1) <= servicePort;
                    stackTop <= stackTop + 1;
                    nextService <= '1';
                    exit;
                end if;
            end loop;
        end if;
        if isrUpdate = '1' and isrUpdate'event then
            isr(runningPort) <= '0';
            runningPort <= PortStack(stackTop - 1);
            stackTop <= stackTop - 1;
        end if;
    	if entered = '1' then
            nextService <= '0';
        end if;
	end process;

    imr <= newImr when imrUpdate = '1' else imr;

end Behavioral;