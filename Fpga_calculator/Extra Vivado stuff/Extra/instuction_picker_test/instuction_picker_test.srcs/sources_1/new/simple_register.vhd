library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_register is
    port(inputs: in std_logic_vector(7 downto 0);
    clock: in std_logic;
    outputs: out std_logic_vector(7 downto 0));

end entity;

architecture behav of simple_register is
begin
    process(clock) is
    begin
        if rising_edge(clock) then
            outputs <= inputs;
        end if;
    end process;


end architecture;