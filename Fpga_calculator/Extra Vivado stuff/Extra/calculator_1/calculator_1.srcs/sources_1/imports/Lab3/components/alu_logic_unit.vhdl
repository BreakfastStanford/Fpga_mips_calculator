library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_logic_unit is
    port(Input1: in std_logic_vector(4 downto 0);
        Output1: out std_logic_vector(1 downto 0));
end entity;

architecture behaviour_alogic of alu_logic_unit is
begin
    process(Input1) is
    begin

        if (Input1(4 downto 3) = "00" and Input1(0) = '0') or 
            (Input1(4 downto 3) = "11" and Input1(0) = '0')then
            Output1 <= "10";
        elsif (Input1(4 downto 3) = "00" and Input1(0) = '1') or
                (Input1(4 downto 2) = "101" and Input1(0) = '1') then
            Output1 <= "00";
        elsif Input1 = "10001" then
            Output1 <= "11";
        elsif Input1 = "10011" then
            Output1 <= "01";
        else 
            Output1 <="10"; -- rest are current dont cares, might as well do nothing
        end if;
    end process;

end architecture;