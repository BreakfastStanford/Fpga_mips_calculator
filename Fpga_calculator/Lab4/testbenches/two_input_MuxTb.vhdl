library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity two_input_MuxTb is
end entity;

architecture sim of two_input_MuxTb is


-- signals
constant DWidth : integer := 8;
signal inputTb1, inputTb2, outputTb: std_logic_vector(DWidth-1 downto 0);
signal selTb: std_logic;

-- components
-- uses the generics to determine signal bus widths
component two_input_Mux is
    generic(DataWidth: integer); 
        port(Input1, Input2: in std_logic_vector (DataWidth-1 downto 0); -- if data width is 1 then input busses will be 1 bit
            Sel: in std_logic;
            OutputD : out std_logic_vector (DataWidth-1 downto 0)); 
end component;



begin

-- port map

mux: two_input_Mux
generic map ( DataWidth => DWidth)
 port map(Input1 => inputTb1, Input2 => inputTb2, OutputD => outputTb, Sel => selTb);
process is
begin
    inputTb1 <= "00001111";
    inputTb2 <= "11110000";
    selTb <= '0'; -- select input1

    wait for 40 ns;
    
    if(outputTb = inputTb1) then
        report "the result is correct";
    end if;

    report "Test 1 - input 1 selected";
    assert outputTb = inputTb1
    report "Bad output" severity error;
    -- end test 1


    -- start test 2
    inputTb1 <= "00001111";
    inputTb2 <= "11110000";
    selTb <= '1'; -- select input1

    wait for 4 ns;

    report "Test 2 - input 2 selected";
    assert outputTb = inputTb2
    report "Bad output" severity error;
    -- end test 2


    -- start test 3
    inputTb1 <= "00000000";
    inputTb2 <= "11111111";
    selTb <= '0'; -- select input1

    wait for 4 ns;

    report "Test 3 - input 1 selected";
    assert outputTb = inputTb1
    report "Bad output" severity error;
    -- end test 3


    -- start test 4
    inputTb1 <= "00000000";
    inputTb2 <= "11111111";
    selTb <= '1'; -- select input1

    wait for 4 ns;

    report "Test 4 - input 2 selected";
    assert outputTb = inputTb2
    report "Bad output" severity error;
    -- end test 4
wait;    
end process;
end architecture;