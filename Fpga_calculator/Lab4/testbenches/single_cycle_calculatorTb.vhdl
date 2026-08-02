library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_cycle_calculatorTb is
end entity;


architecture sim of single_cycle_calculatorTb is

    -- signals
    signal instruction: std_logic_vector (7 downto 0);
    signal clockTb: std_logic;

    -- components
    component single_cycle_calculator is
        port(Inputs: in std_logic_vector(7 downto 0);
            clockC: in std_logic);
    end component;
    

    
    -- declare a record type to hold testing values
    type testing_values is record
    i: std_logic_vector(7 downto 0);
    c: std_logic;
    end record testing_values;

    -- declare array of testing values
    type testing_array is array (natural range <>) of testing_values;

    -- instance of array
    constant testing_array_inst: testing_array :=
    (
        ("11010001", '0'),
        ("11010001", '1'),
    
        ("10010010", '0'),
        ("10010010", '1'),

        ("00111000", '0'),
        ("00111000", '1'),

        ("11100111", '0'),
        ("11100111", '1'),

        ("10110101", '0'),
        ("10110101", '1'),

        ("00110100", '0'),
        ("00110100", '1'),

        ("00100100", '0'),
        ("00100100", '1'),

        ("11010100", '0'),
        ("11010100", '1'),

        ("10000110", '0'),
        ("10000110", '1'),

        ("00111000", '0'),
        ("00111000", '1'),

        ("00101100", '0'),
        ("00101100", '1'),

        ("10111010", '0'),
        ("10111010", '1'),

        ("00110100", '0'),
        ("00110100", '1')
    ); 
 


begin
    -- portmap
calc: single_cycle_calculator port map(Inputs => instruction, clockC => clockTb);
    process is
    begin
        for i in testing_array_inst'range loop
            instruction <= testing_array_inst(i).i;
            clockTb <= testing_array_inst(i).c;
            wait for 10 ns; 
        end loop;
wait for 10 ns;
        
    wait;
    end process;    
end architecture;