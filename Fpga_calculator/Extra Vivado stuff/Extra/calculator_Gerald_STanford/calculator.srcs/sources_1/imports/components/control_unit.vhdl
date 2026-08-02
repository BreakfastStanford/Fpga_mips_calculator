library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
    port(InputOP: in std_logic_vector(3 downto 0);
        we, wdx, inx, alu, pri, jb, bb: out std_logic);
end entity;

architecture behaviour_control of control_unit is
begin

multiBit: process(InputOP) is
    begin
        if InputOP(3 downto 2) = "10" then
            we <= '1';
            wdx <= '1';
            alu <= '1';
            inx <= '0';
            pri <= '0';
            jb <= '0';
            bb <= '0'; 
        elsif InputOP(3 downto 2) = "11" then
            we <= '1';
            wdx <= '1';
            alu <= '0';
            inx <= '0';
            pri <= '0';
            jb <= '0';
            bb <= '0';   
        elsif InputOP(3 downto 2) = "01" then
            we <= '0';
            wdx <= '0';
            alu <= '1';
            inx <= '0';
            pri <= '0';
            jb <= '0';
            bb <= '1'; 
        
        elsif InputOP = "0010" then
            we <= '1';
            wdx <= '1';
            alu <= '1';
            inx <= '1';
            pri <= '0';
            jb <= '0';
            bb <= '0';
        elsif InputOP ="0011" then
            we <= '0';
            wdx <= '0';
            alu <= '0';
            inx <= '0';
            pri <= '1';
            jb <= '0';
            bb <= '0';
        elsif InputOP ="0000" then
            we <= '0';
            wdx <= '0';
            alu <= '0';
            inx <= '0';
            pri <= '0';
            jb <= '1';
            bb <= '0';
        end if;

    end process;

end architecture;