library ieee;
use ieee.std_logic_1164.all;

entity eight_input_inverterTb is
end entity;

architecture sim of eight_input_inverterTb is


-- signals
signal inputTb, outputTb: std_logic_vector(7 downto 0);

-- components
component eight_input_inverter is
    port(Input1: in std_logic_vector (7 downto 0); Output1: out std_logic_vector (7 downto 0)); --port identifiers
end component;

begin

    -- portmap
    inverter: eight_input_inverter port map(Input1 => inputTb, Output1 => outputTb);

invert: process is
begin

    inputTb <= "00001111";
    wait for 4 ns;

    report "Test 1";
    if outputTb = "11110000" then
        report "This is the expected value";
    else
        report "Error" severity error;
                
    end if;    


    inputTb <= "11110000";
    wait for 4 ns;

    report "Test 2";
    if outputTb = "00001111" then
        report "This is the expected value";
    else
        report "Error" severity error;
                
    end if;    
        
    inputTb <= "00000000";
    wait for 4 ns;

    report "Test 3";
    if outputTb = "11111111" then
        report "This is the expected value";
    else
        report "Error" severity error;
                
    end if;    

    inputTb <= "11111111";
    wait for 4 ns;

    report "Test 4";
    if outputTb = "00000000" then
        report "This is the expected value";
    else
        report "Error" severity error;
                
    end if;    


    inputTb <= "01111111";
    wait for 4 ns;

    report "Test 5";
    if outputTb = "10000000" then
        report "This is the expected value";
    else
        report "Error" severity error;
                
    end if;    

wait;
end process;    
end architecture;