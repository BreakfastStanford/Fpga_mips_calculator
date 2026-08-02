library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity twos_complement_circuitTb is
end entity;


architecture sim of twos_complement_circuitTb is

--signals
signal inputTb1, inputTb2, outputTb1, outputTb2: std_logic_vector(7 downto 0);
signal selTb: std_logic := '0';

--components
component twos_complement_circuit is
    port(Input1, Input2: in std_logic_vector(7 downto 0);
        Output1, Output2: out std_logic_vector(7 downto 0);
        SelT: in std_logic);
end component;

-- declare a record type to hold testing values
type testing_values is record
    i1: std_logic_vector(7 downto 0);
    i2: std_logic_vector(7 downto 0);
    s: std_logic;
    o1: std_logic_vector(7 downto 0);
    o2: std_logic_vector(7 downto 0);

end record testing_values;

-- declare array of testing values
type testing_array is array (natural range <>) of testing_values;

-- instance of array
constant testing_array_inst: testing_array :=
(
    ("11111111", "11111111", '0',"11111111", "11111111"), -- 0
    ("00010101", "00001111", '1',"00000001", "11110000"), -- 1
    ("11111111", "01111111", '1',"00000001", "10000000"), -- 1
    ("10010110", "01010101", '0',"10010110", "01010101"), -- 0
    ("00010101", "00001111", '0',"00010101", "00001111"), -- 0 
    ("10010110", "01010101", '1',"00000001", "10101010") -- 1
 );

begin
-- portmap
twos: twos_complement_circuit 
port map(Input1 => inputTb1, Input2 => inputTb2, Output1 => outputTb1, Output2 => outputTb2, SelT => selTb);

    process is
    begin  
    for i in testing_array_inst'range loop
        report "test index "& integer'image(i);
        inputTb1 <= testing_array_inst(i).i1;
        inputTb2 <= testing_array_inst(i).i2;
        selTb <= testing_array_inst(i).s;

        wait for 10 ns;
        if outputTb1 = testing_array_inst(i).o1 and outputTb2 = testing_array_inst(i).o2  then
            report "Test succesful";
        else
            report "Bad Result" severity error;
        end if;
        report "Input1: "& integer'image(to_integer(signed(inputTb1))); 
        report "Input2: "& integer'image(to_integer(signed(inputTb2))); 
        report "Output1: "& integer'image(to_integer(signed(outputTb1)));
        report "Output2: "& integer'image(to_integer(signed(outputTb2)));
        report "sel bit: "& std_logic'image(selTb);
        report "";    
    end loop;

    wait;
    end process;    
end architecture;