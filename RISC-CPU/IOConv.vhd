----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:26 08/02/2015 
-- Design Name: 
-- Module Name:    IOConv - Behavioral 
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

entity IOConv is
    Port ( IOAD : in  STD_LOGIC_VECTOR (1 downto 0);
           IODB : inout  STD_LOGIC_VECTOR (7 downto 0);
           nPREQ : in  STD_LOGIC;
           nPRD : in  STD_LOGIC;
           nPWR : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end IOConv;

architecture Behavioral of IOConv is

begin

    -- This is a IO device simulator adapted on Nexys3.
    -- Address -> device:
    -- 00 -> sw(7 downto 0)
    -- 01 -> sw(0 to 7)
    -- 10 -> led(7 downto 0)
    -- 11 -> led(0 to 7)
    process (IOAD, IODB, nPREQ, nPRD, nPWR, sw)
    begin
        IODB <= (others => 'Z');
        led <= (others => '0');
        if nPREQ = '0' then
            if nPRD = '0' and nPWR = '1' then
                case IOAD is
                    when "00" => IODB <= sw;
                    when "01" => 
                    rev1: for i in 7 downto 0 loop
                            IODB(i) <= sw(7-i);
                          end loop rev1;
                    when others => null;
                end case;
            elsif nPRD = '1' and nPWR = '0' then
                case IOAD is
                    when "10" => led <= IODB;
                    when "11" =>
                    rev2: for i in 7 downto 0 loop
                            led(i) <= IODB(7-i);
                          end loop rev2;
                    when others => null;
                end case;
            end if;
        end if;
    end process;

end Behavioral;

