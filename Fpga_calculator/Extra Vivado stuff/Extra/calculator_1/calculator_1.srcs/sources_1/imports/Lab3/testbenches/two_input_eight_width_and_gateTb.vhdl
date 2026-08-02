library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity two_input_eight_width_and_gateTb is
end entity;

architecture sim of two_input_eight_width_and_gateTb is 

--signals and constants
signal inputTb1, inputTb2, outputTb: std_logic_vector (7 downto 0);
constant test : std_logic_vector(7 downto 0) :="00000001";
-- components
component two_input_eight_width_and_gate is
    port(Input1, Input2: in std_logic_vector(7 downto 0); Output1: out std_logic_vector(7 downto 0));
end component;



begin

 -- port map
and_gate: two_input_eight_width_and_gate port map(Input1 => inputTb1, Input2 => inputTb2, Output1 => outputTb);

-- processes
process is
begin

    inputTb1 <= "10111111"; -- (others => '0');
    inputTb2 <= "10111111"; -- (others => '0');
    wait for 4 ns;

    if ( outputTb = "10111111") then
        report "the output is expected";
        report "Output: "& integer'image(to_integer(unsigned(outputTb))); 
      --  report "Output: "& std_logic_vector'image(outputTb); 
    else    
        report "bad output value" severity error;
    end if;
    
    inputTb1 <= "10101010"; -- (others => '0');
    inputTb2 <= "01010101"; -- (others => '0');
    wait for 4 ns;

    if ( outputTb = "00000000") then
        report "inversion test";
        report "the output is expected"; 
        report "Output: "& integer'image(to_integer(unsigned(outputTb)));
        --report "Output: "& std_logic_vector'image(outputTb); 
    else    
        report "bad output value" severity error;
    end if;
    
    inputTb1 <= "11111111"; -- (others => '0');
    inputTb2 <= "11111111"; -- (others => '0');
    wait for 4 ns;

    if ( outputTb = "11111111") then
        report "all highs test";
        report "the output is expected"; 
        report "Output: "& integer'image(to_integer(unsigned(outputTb)));
        --report "Output: "& std_logic_vector'image(outputTb); 
    else    
        report "bad output value" severity error;
    end if;
 

wait;    
end process;
end architecture;