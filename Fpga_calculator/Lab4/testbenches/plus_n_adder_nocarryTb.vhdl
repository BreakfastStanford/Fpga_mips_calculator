library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity plus_n_adder_nocarryTb is
end entity;


architecture sim of plus_n_adder_nocarryTb is

    -- constants
constant DataWidth: integer := 8;        
    --signals
signal inputTb1, inputTb2, outputTb: std_logic_vector(DataWidth-1 downto 0);

    --components
    component plus_n_adder_nocarry is
        generic(DataWidth: integer); 
        port(Input1, Input2: in std_logic_vector(DataWidth-1 downto 0);
            Output1: out std_logic_vector(DataWidth-1 downto 0));
    end component;


-- declare a record type to hold testing values
type testing_values is record
    i1: std_logic_vector(DataWidth-1 downto 0);
    i2: std_logic_vector(DataWidth-1 downto 0);
    o: std_logic_vector(DataWidth-1 downto 0);
end record testing_values;

-- declare array of testing values
type testing_array is array (natural range <>) of testing_values;

-- instance of array
constant testing_array_inst: testing_array :=
(
    ("00000001", "00000001", "00000010"),
    ("00000001", "10000001", "10000010"),
    ("00000001", "10001111", "10010000"),
    ("00000001", "10000000", "10000001"),
    ("00000001", "11111111", "00000000"),
    ("10000101", "01010101", "11011010"),
    ("00001101", "01000101", "01010010"),
    ("00000001", "01111111", "10000000"),
    ("00000001", "00000000", "00000001")
 );

begin 
--port maps
add: plus_n_adder_nocarry generic map ( DataWidth =>  DataWidth) port map(Input1 => inputTb1, Input2 => inputTb2, Output1 => outputTb);

    addition: process is
    begin
        
        for i in testing_array_inst'range loop
            report "test index "& integer'image(i);
            inputTb1 <= testing_array_inst(i).i1;
            inputTb2 <= testing_array_inst(i).i2;

            wait for 4 ns;
            if outputTb = testing_array_inst(i).o then
                report "Test succesful";
            else
                report "Bad Result" severity error;
            end if;
            report "Input1: "& integer'image(to_integer(signed(inputTb1))); 
            report "Input2: "& integer'image(to_integer(signed(inputTb2))); 
            report "Output: "& integer'image(to_integer(signed(outputTb)));
            report "";    
        end loop;
        wait;
    end process;

end architecture;