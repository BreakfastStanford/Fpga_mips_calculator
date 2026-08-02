library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity plus_n_adder_nocarry is
    generic(DataWidth: integer); 
    port(Input1, Input2: in std_logic_vector(DataWidth-1 downto 0);
        Output1: out std_logic_vector(DataWidth-1 downto 0));
end entity;

architecture behaviour_adder of plus_n_adder_nocarry is
begin
    add: process(Input1, Input2) is
        begin
        
        --Input1 <= std_logic_vector(to_unsigned(setInput,Input1'length));
        Output1 <= std_logic_vector(signed(Input1) + signed(Input2));

    end process;
end architecture;