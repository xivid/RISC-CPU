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

entity IntCtrl is
port(
	intr: in std_logic_vector(7 downto 0);
	newImr: in std_logic_vector(7 downto 0);
	intServicePort: out integer;
	eint: in std_logic;
	T3: in std_logic;
	intrUpdate: in std_logic;
	irrUpdated: out std_logic;
	nextService: out std_logic;
	pcProtected: in std_logic;
	imrFetched: in std_logic;
	returnLastInt: in std_logic;
	alreadyReturn: out std_logic
);
end IntCtrl;

architecture Behavioral of IntCtrl is
	signal irr: std_logic_vector(7 downto 0):= "00000000";
	signal isr: std_logic_vector(7 downto 0):= "00000000";
	signal imr: std_logic_vector(7 downto 0):= "00000000";
	type stackType is array(7 downto 0) of std_logic_vector(7 downto 0);
	shared variable imrStack: stackType;
	shared variable top: integer:=0;
begin
	
	process(intrUpdate)
		variable servicePort: integer:=0;
	begin
		if intrUpdate='1' then
			setIRR: while servicePort < 8 loop
				irr(servicePort) <= '0' when imr(i) = '1' else intr(i);
			end loop;
			irrUpdated<='1';
		else
			irrUpdated<='0';
		end if;
	end process;
	
	process(irr,eint,isr,imr)--int active
		variable servicePort: integer:=0;
	begin
		if conv_integer(irr)/=0 then
			getNextInt: while servicePort < 8 loop
			if (irr(servicePort) and not isr(servicePort))='1' and imr(servicePort) then
				isr(servicePort) <= '1';
				irr(servicePort) <= '0';
				intServicePort <= servicePort;
				nextServicePort <= '1';
				imrStack(top):=imr;
				top:=top+1;
				exit;
			else 
				servicePort := servicePort+1;
				nextServicePort <= '0';
			end if;
			end loop;
		else
			nextServicePort <= '0';
		end if;
	end process;

	process(imrFetched,pcProtected)
	begin
		if imrFetched = '1' and pcProtected = '1' then
			imr <= newImr;
		end if;
	end process;
	
	process(returnLastInt)
	begin
		if returnLastInt = '1' and T3='1' then
			imr <= imrStack(top);
			top:= top-1;
			alreadyReturn <= '1';
		else
			alreadyReturn <= '0';
		end if;
	end process;

end Behavioral;