library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_logic_unit is
    port(Input1: in std_logic_vector(4 downto 0);
        Output1: out std_logic_vector(2 downto 0));
end entity;

architecture behaviour_alogic of alu_logic_unit is
begin
    process(Input1) is
    begin
        if Input1 = "00000" then
            Output1 <= "010";
        elsif Input1 = "10001" then
            Output1 <= "011";
        elsif Input1 = "10011" then
            Output1 <= "001";
        elsif Input1 = "00010" then
            Output1 <= "100";     
        elsif Input1(4 downto 3) = "01" and Input1(0) = '1' then
            Output1 <= "011";
        elsif Input1(4 downto 3) = "11" and Input1(0) = '0' then
            Output1 <= "010";
        elsif (Input1(4 downto 3) = "00" and Input1(0) = '1') or
            (Input1(4 downto 2) = "101" and Input1(0) = '1') then
        Output1 <= "000";    
        else 
            Output1 <="010"; -- rest are current dont cares, might as well do nothing
        end if;
    end process;

end architecture;