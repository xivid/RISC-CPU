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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
           btnd : in std_logic;
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           nextService : out std_logic;
           intServicePort : out integer;
           intr : in std_logic_vector(7 downto 0);
           intrUpdate : in std_logic;
           isrUpdate : in std_logic);
end IOConv;

architecture Behavioral of IOConv is
-- INTctrl
    component INTctrl
        port(
            intr: in std_logic_vector(7 downto 0);
            newImr: in std_logic_vector(7 downto 0);
            intrUpdate: in std_logic;
            imrUpdate: in std_logic;
            isrUpdate: in std_logic;
            nextService: out std_logic;
            intServicePort: out integer;
            nowImr: out std_logic_vector(7 downto 0)
        );
    end component;
    
    signal newImr, nowImr : std_logic_vector(7 downto 0);
    signal imrUpdate, thenextService : std_logic;
    signal theintServicePort : integer;
begin
    nextService <= thenextService;
    intServicePort <= theintServicePort;
    comINTctrl: INTctrl port map(
                intr => intr,
                newImr => newImr,
                intrUpdate => intrUpdate,
                imrUpdate => imrUpdate,
                isrUpdate => isrUpdate,
                nextService => thenextService,
                intServicePort => theintServicePort,
                nowImr => nowImr);
    -- This is a IO device simulator adapted on Nexys3.
    -- Address -> device:
    -- 00 -> sw(7 downto 0)
    -- 01 -> INTctrl imr
    -- 10 -> led(7 downto 0)
    -- 11 -> INTctrl imr
    process (IOAD, IODB, nPREQ, nPRD, nPWR, sw, nowImr, btnd, intr, thenextService, intrUpdate, isrUpdate, theintServicePort)
    begin
        IODB <= (others => 'Z');
        led <= (others => not nPREQ);
        imrUpdate <= '0';
        if nPREQ = '0' then
            if nPRD = '0' and nPWR = '1' then -- IN
                case IOAD is
                    when "00" => IODB <= sw;
                    when "01" => IODB <= nowImr;-- imr
                    when others => null;
                end case;
            elsif nPRD = '1' and nPWR = '0' then -- OUT
                case IOAD is
                    when "10" => led <= IODB;
                    when "11" => 
                        newImr <= IODB;
                        imrUpdate <= '1';
                    when others => null;
                end case;
            end if;
--        else
--            led <= (others => '1');
--            if btnd = '1' then
--                led <= intr;
--            else
--                led(0) <= thenextService;
--                led(1) <= intrUpdate;
--                led(2) <= isrUpdate;
--                led(7 downto 4) <= conv_std_logic_vector(theintServicePort, 4);
--            end if;
        end if;
    end process;

end Behavioral;

