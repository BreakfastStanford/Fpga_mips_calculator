library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extender is
    port(Input1: in std_logic_vector(3 downto 0);
        Output1: out std_logic_vector(7 downto 0));
end sign_extender;

architecture behaviour_ext of sign_extender is
begin
ext: process (Input1) is
    begin

        if Input1(3) = '0' then
            Output1(3 downto 0) <= Input1;
            Output1(7 downto 4) <= (others => '0');
        elsif Input1(3) = '1' then
            Output1(3 downto 0) <= Input1;
            Output1(7 downto 4) <= (others => '1');
        else
            Output1 <= (others => '0');        
        end if;        
     
        
    end process;
end behaviour_ext;