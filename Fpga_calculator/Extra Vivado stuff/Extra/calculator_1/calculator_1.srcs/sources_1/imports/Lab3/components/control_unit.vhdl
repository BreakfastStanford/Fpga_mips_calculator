library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
    port(InputOP: in std_logic_vector(3 downto 0);
        we, wdx, inx, alu, pri: out std_logic);
end entity;

architecture behaviour_control of control_unit is
begin

multiBit: process(InputOP) is
    begin
        if InputOP = "0010" or InputOP(3 downto 2) ="10" then
            we <= '1';
            wdx <= '1';
            alu <= '1';
        elsif InputOP(3 downto 2) = "11" then
            we <= '1'; 
            wdx <= '0'; -- may be dont cares...leave as 0 for now
            alu <= '0'; 
        else
            we <= '0'; 
            wdx <= '0'; -- may be dont cares...leave as 0 for now
            alu <= '0';  
        end if;

    end process;

inxBit: process(InputOP) is
    begin
        if InputOP = "0010" then
            inx <= '1';
        else
            inx <= '0'; -- may be dont cares...leave as 0 for now 
        end if;

    end process;

priBit: process(InputOP) is
    begin
        if InputOP = "0011" then
            pri <= '1';
        else
            pri <= '0'; -- may be dont cares...leave as 0 for now 
        end if;

    end process;

end architecture;