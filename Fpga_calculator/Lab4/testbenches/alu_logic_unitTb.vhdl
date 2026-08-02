library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_logic_unitTb is
end entity;


architecture sim of alu_logic_unitTb is

    --signals
    signal inputTb: std_logic_vector(4 downto 0);
    signal outputTb: std_logic_vector(1 downto 0);

    --component
    component alu_logic_unit is
        port(Input1: in std_logic_vector(4 downto 0);
            Output1: out std_logic_vector(1 downto 0));
    end component;



    -- declare a record type to hold testing values
    type testing_values is record
    i: std_logic_vector(4 downto 0);
    o: std_logic_vector(1 downto 0);
    s: string(1 to 17) ;
    end record testing_values;

    -- declare array of testing values
    type testing_array is array (natural range <>) of testing_values;

    -- instance of array
    constant testing_array_inst: testing_array :=
    (
    ("00000", "10", "Do nothing - 10  "), -- all codes 
    ("00100", "10", "Do nothing - 10  "),
    ("00110", "10", "Do nothing - 10  "),
    ("00000", "10", "Do nothing - 10  "),
    ("00001", "00", "add - 00         "),
    ("00011", "00", "add - 00         "),
    ("00111", "00", "add - 00         "),
    ("10001", "11", "set on equa1 - 11"),
    ("10011", "01", "subtract - 01    "),
    ("10101", "00", "add - 00         "),
    ("10111", "00", "add - 00         "),
    ("11000", "10", "Do nothing - 10  "),
    ("11100", "10", "Do nothing - 10  "),
    ("11110", "10", "Do nothing - 10  "),
    ("01110", "10", "Do nothing - 10  "), -- not codes should all do nothing 10
    ("01001", "10", "Do nothing - 10  "),
    ("01011", "10", "Do nothing - 10  "),
    ("01101", "10", "Do nothing - 10  "),
    ("11001", "10", "Do nothing - 10  "),
    ("10010", "10", "Do nothing - 10  "),
    ("11100", "10", "Do nothing - 10  "),
    ("11111", "10", "Do nothing - 10  "));

begin
--portmap
alu_log_u: alu_logic_unit port map(Input1 => inputTb, Output1 => outputTb);

control: process is
    begin
        
        for i in testing_array_inst'range loop
            report "test index "& integer'image(i);
            inputTb <= testing_array_inst(i).i;


            wait for 10 ns;
            if outputTb = testing_array_inst(i).o then
                report "Test succesful";
            else
                report "Bad Result" severity failure;
            end if;
            report "Input1: "& integer'image(to_integer(unsigned(inputTb))); 
            report "Output: "& integer'image(to_integer(unsigned(outputTb)));
            report "Operation: "& testing_array_inst(i).s;
            report "";    
            
        end loop;
        wait;
    end process;
end architecture;