library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_picker_tb is
end entity;


architecture sim of instruction_picker_tb is

    --signals
signal in1: std_logic_vector(7 downto 0);
signal j, b, c: std_logic;
signal o: std_logic_vector(7 downto 0);

    --components
    component instruction_picker is
        port(User_Input: in std_logic_vector(7 downto 0);
            jump_bit, branch_bit: in std_logic;
            clock: in std_logic;
            Output_1: out std_logic_vector(7 downto 0));
    end component;
    
        -- declare a record type to hold testing values
type testing_values is record
i: std_logic_vector(7 downto 0);
j: std_logic;
b: std_logic;
c: std_logic;
o: std_logic_vector(7 downto 0);
end record testing_values;

-- declare array of testing values
type testing_array is array (natural range <>) of testing_values;

-- instance of array
constant testing_array_inst: testing_array :=
(
("00000111", '1', '0', '1', "00000111" ),
("00000111", '1', '0', '0', "00000111" ),   
("00000111", '0', '0', '1', "00000000" ), 
("10000111", '0', '0', '0', "00000000" ),  
("10000111", '0', '0', '1', "10000111" ),
("10000111", '0', '1', '0', "10000111" ),  
("11000111", '0', '1', '1', "11000111" ), 
("11000111", '0', '1', '0', "11000111" ),     
("11000111", '0', '0', '1', "11110000" )                     
);






begin
    -- portmap
ip: instruction_picker port map (User_Input => in1, jump_bit => j, branch_bit =>b,
clock => c, Output_1 => o);


--------------------------------------
control: process is
    begin
        
        for i in testing_array_inst'range loop

            -- drive values
            report "test index "& integer'image(i);
            in1 <= testing_array_inst(i).i;
            j <= testing_array_inst(i).j;
            c <= testing_array_inst(i).c;
            b <= testing_array_inst(i).b;
            wait for 10 ns;
            -- assign a new value to a specific variable based on conditions
            assert o = testing_array_inst(i).o; report "Bad value" severity error;
       
            
        end loop;

            Report "worked as expected";
        wait;
    end process;


end architecture;


-- run test array and drive values 
-- assign a new value to a specific variable based on conditions
-- drive each rs to a diffrent value and compare the rd1 with the variable