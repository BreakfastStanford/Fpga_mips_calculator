library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_module is
    port(Input1: in std_logic_vector(7 downto 0);
        enable: in std_logic);
end entity;


architecture behav_print of print_module is
    --
    signal outputN: std_logic_vector (7 downto 0) := (others => '0');
begin
    process (enable) is
    begin
        if enable = '1' then
            outputN <= Input1;
            report ""& integer'image(to_integer(signed(outputN)));
        end if;
        
    end process;

    
end architecture;