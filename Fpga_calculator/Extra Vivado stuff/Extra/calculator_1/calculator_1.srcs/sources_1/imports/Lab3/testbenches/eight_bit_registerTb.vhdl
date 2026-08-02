library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- testbench entity
entity eight_bit_registerTb is
end entity;


-- testbench arch
architecture regBehav of eight_bit_registerTb  is

-- signals to map to  
signal inputTb, outputTb: std_logic_vector (7 downto 0);
signal clockTb, enableTb: std_logic;   


-- component to test
component eight_bit_register is
    port(Input1: in std_logic_vector(7 downto 0) := (others => '0');
        Output1: out std_logic_vector (7 downto 0) := (others => '0');
        clock: in std_logic;
        enable: in std_logic);
end component;

-- declare a record type to hold testing values
type testing_values is record
    i: std_logic_vector(7 downto 0);
    o: std_logic_vector(7 downto 0);
    --cu: std_logic_vector(7 downto 0);
    c: std_logic;
    e: std_logic;
end record testing_values;

-- declare array of testing values
type testing_array is array (natural range <>) of testing_values;

-- instance of array
constant testing_array_inst: testing_array :=
(
    ("10101010", "00000000",'0', '0'), --n
    ("10101010", "00000000",'0', '1'), --n
    ("10101010", "10101010",'1', '1'), --s
    ("01000101", "10101010",'1', '0'), --n
    ("01000101", "10101010",'0', '0'), --n
    ("01000101", "01000101",'1', '1'), --s
    ("00110100", "01000101",'0', '0'), --n
    ("10101010", "01000101",'0', '1'), --n
    ("01110100", "01000101",'1', '0'), --n
    ("01110100", "01000101",'1', '1'), --because it stayed on 1, it is not rising edge
    ("10010100", "01000101",'0', '1'), --n
    ("00000000", "00000000",'1', '1'), --s
    ("11100111", "00000000",'1', '1'), ----because it stayed on 1, it is not rising edge
    ("11100111", "00000000",'0', '1'),
    ("11100111", "11100111",'1', '1')
    );


begin

    -- port map
    
reg: eight_bit_register 
port map (Input1 => inputTb, Output1 => outputTb, clock => clockTb, enable => enableTb);    
    control: process is
        begin
            
            for i in testing_array_inst'range loop
                report "test index "& integer'image(i);
                inputTb <= testing_array_inst(i).i;
                clockTb <= testing_array_inst(i).c;
                enableTb <= testing_array_inst(i).e;
               
                wait for 10 ns;
                if outputTb = testing_array_inst(i).o then
                    report "Test succesful";
                else
                    report "Bad Result" severity failure;
                end if;
                report "Input1: "& integer'image(to_integer(unsigned(inputTb))); 
                report "Output: "& integer'image(to_integer(unsigned(outputTb)));
                report "clock: "& std_logic'image(clockTb);
                report "enableBit: "& std_logic'image(enableTb);
                report "";    
                
            end loop;
            wait;
        end process;


    --clk: process is
    --    begin

    --    wait;    
   -- end process
end architecture;



