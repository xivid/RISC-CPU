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
	nextService: out std_logic;
    intServicePort: out integer;
    nowimr: out std_logic_vector(7 downto 0)
);
end INTctrl;

architecture Behavioral of INTctrl is
	signal irr: std_logic_vector(7 downto 0):= "00000000"; -- 待响应的序号
	signal isr: std_logic_vector(7 downto 0):= "00000000"; -- 尚未执行完毕的中断服务程序
	signal imr: std_logic_vector(7 downto 0):= "00000000"; -- 屏蔽字
    signal runningPort : integer;
begin
	intServicePort <= runningPort;
    nowimr <= imr;
	process(intrUpdate, intr, imr)
	begin
		if intrUpdate='1' then
			setIRR: for servicePort in 0 to 7 loop
				irr(servicePort) <= '0' when imr(servicePort) = '1' else intr(servicePort);
			end loop;
		end if;
	end process;
	
    process(isrUpdate, runningPort)
    begin
        if isrUpdate = '1' then
            isr(runningPort) <= '0';
        end if;
    end process;
	process(irr,isr) --int active
	begin
		if conv_integer(irr)/=0 then
            nextService <= '0';
			getNextInt: for servicePort in 0 to 7 loop
                if (irr(servicePort) and (not isr(servicePort)))='1' then
                    isr(servicePort) <= '1';
                    irr(servicePort) <= '0';
                    runningPort <= servicePort;
                    nextService <= '1';
                    exit;
                end if;
			end loop;
		else
			nextService <= '0';
		end if;
	end process;

	process(imrUpdate, newImr)
	begin
		if imrUpdate = '1' then
			imr <= newImr;
		end if;
	end process;

end Behavioral;