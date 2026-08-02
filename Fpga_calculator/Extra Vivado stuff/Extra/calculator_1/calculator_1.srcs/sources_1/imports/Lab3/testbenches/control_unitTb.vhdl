library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unitTb is
end entity;

architecture sim of control_unitTb is

    --signals
    signal inputTb: std_logic_vector(3 downto 0);
    signal weTb, wdxTb, inxTb, aluTb, priTb: std_logic;

    --component
    component control_unit is
        port(InputOP: in std_logic_vector(3 downto 0);
            we, wdx, inx, alu, pri: out std_logic);
    end component;
    



    -- declare a record type to hold testing values
    type testing_values is record
    i: std_logic_vector(3 downto 0);
    we: std_logic;
    wdx: std_logic;
    inx: std_logic;
    alu: std_logic;
    pri: std_logic;
    end record testing_values;

    -- declare array of testing values
    type testing_array is array (natural range <>) of testing_values;

    -- instance of array
    constant testing_array_inst: testing_array :=
    (
    ("0010", '1', '1', '1', '1', '0'),  -- should produce 1's
    ("0011", '0', '0', '0', '0', '1'),
    ("1010", '1', '1', '0', '1', '0'),
    ("1011", '1', '1', '0', '1', '0'),
    ("1000", '1', '1', '0', '1', '0'),
    ("0110", '0', '0', '0', '0', '0'), -- should produce all 0
    ("0101", '0', '0', '0', '0', '0'),
    ("1100", '1', '0', '0', '0', '0'), -- load, should still produce 0 
    ("0110", '0', '0', '0', '0', '0'),
    ("1111", '1', '0', '0', '0', '0'),
    ("0000", '0', '0', '0', '0', '0')
    );

begin
--portmap
cu: control_unit 
port map(InputOP => inputTb, we=> weTb,wdx=> wdxTb, inx => inxTb,alu => aluTb, pri => priTb );

control: process is
    begin
        
        for i in testing_array_inst'range loop
            report "test index "& integer'image(i);
            inputTb <= testing_array_inst(i).i;


            wait for 4 ns;
            assert weTb = testing_array_inst(i).we report "bad result" severity failure;
            assert wdxTb = testing_array_inst(i).wdx report "bad result" severity failure;
            assert inxTb = testing_array_inst(i).inx report "bad result" severity failure;
            assert aluTb = testing_array_inst(i).alu report "bad result" severity failure;
            assert priTb = testing_array_inst(i).pri report "bad result" severity failure;
            report "Test Succesful";
            report "";
            
        end loop;
        wait;
    end process;
end architecture;