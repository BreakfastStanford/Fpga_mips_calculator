library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluTb is
end entity;

architecture sim of aluTb is
    -- signals
signal inputTb1, inputTb2, outputTb: std_logic_vector(7 downto 0);
signal opTb: std_logic_vector (1 downto 0);
signal setTb: std_logic;

    -- component
    component alu is
        port(Input1, Input2: in std_logic_vector(7 downto 0);
            op: in std_logic_vector(1 downto 0);
            Output1: out std_logic_vector(7 downto 0);
            set: out std_logic);
    end component;



    -- declare a record type to hold testing values
    type testing_values is record
    i1: std_logic_vector(7 downto 0);
    i2: std_logic_vector(7 downto 0);
    o: std_logic_vector(7 downto 0);
    op: std_logic_vector(1 downto 0);
    set: std_logic;
    end record testing_values;

    -- declare array of testing values
    type testing_array is array (natural range <>) of testing_values;

    -- instance of array
    constant testing_array_inst: testing_array :=
    (

       ("00001101", "01010010", "01011111", "00", '0'),
       ("00001101", "01010010", "10111011", "01", '0'),
       ("00001101", "01010010", "10111011", "10", '0'),
       ("00001101", "01010010", "10111011", "11", '0'),

      ("01100110", "01100110", "11001100", "00", '0'),
      ("01100110", "01100110", "00000000", "01", '0'),
      ("01100110", "01100110", "00000000", "10", '0'),
      ("01100110", "01100110", "00000000", "11", '1'),

    ("10001010", "00010100", "10011110", "00", '1'),
    ("10001010", "00010100", "01110110", "01", '1'),
    ("10001010", "00010100", "01110110", "10", '1'),
    ("10001010", "00010100", "01110110", "11", '0'),

    ("00000110", "00000101", "00001011", "00", '0'),
    ("00000110", "00000101", "00000001", "01", '0'),
    ("00000110", "00000101", "00000001", "10", '0'),
    ("00000110", "00000101", "00000001", "11", '0'),

    ("00010110", "00010110", "00101100", "00", '0'),
    ("00010110", "00010110", "00000000", "01", '0'),
    ("00010110", "00010110", "00000000", "10", '0'),
    ("00010110", "00010110", "00000000", "11", '1')
    );
 

begin
-- port map
alu_unit: alu 
port map(Input1 => inputTb1, Input2 => inputTb2, op => opTb, set => setTb, Output1 => outputTb);
process is
begin
    for i in testing_array_inst'range loop
        report "test index "& integer'image(i);
        inputTb1 <= testing_array_inst(i).i1;
        inputTb2 <= testing_array_inst(i).i2;
        opTb <= testing_array_inst(i).op;

        wait for 10 ns;
        if outputTb = testing_array_inst(i).o and setTb = testing_array_inst(i).set  then
            report "Test succesful";
        else
            report "Bad Result" severity failure;
        end if;
        report "Input1: "& integer'image(to_integer(signed(inputTb1))); 
        report "Input2: "& integer'image(to_integer(signed(inputTb2))); 
        report "op: "& integer'image(to_integer(unsigned(opTb))); 
        report "Output: "& integer'image(to_integer(signed(outputTb)));
        report "Test-Output: "& integer'image(to_integer(signed(testing_array_inst(i).o )));
        report "set output: "& std_logic'image(setTb);
        report "";    
        
    end loop;

    wait;
end process;
end architecture;