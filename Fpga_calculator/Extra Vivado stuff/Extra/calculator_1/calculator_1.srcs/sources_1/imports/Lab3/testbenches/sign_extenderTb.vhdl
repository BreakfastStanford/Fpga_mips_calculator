library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extenderTb is
end entity;

architecture sim of sign_extenderTb is

    -- signals
signal inputTb: std_logic_vector(3 downto 0);
signal outputTb: std_logic_vector(7 downto 0);

    -- components
    component sign_extender is
        port(Input1: in std_logic_vector(3 downto 0);
            Output1: out std_logic_vector(7 downto 0));
    end component;


begin

    -- port map
    sign_ex: sign_extender port map(inputTb, outputTb);

process is
begin
    report "Test 1";
    inputTb <= "0111";
    wait for 2 ns;

    if outputTb = "00000111" then
        report "Test succesfull";
        report "Input: "& integer'image(to_integer(signed(inputTb)));
        report "Output: "& integer'image(to_integer(signed(outputTb)));
    else
        report "Test failed" severity error;
    end if;

    report "";
    report "Test 2";
    inputTb <= "1111";
    wait for 2 ns;

    if outputTb = "11111111" then
        report "Test succesfull";
        report "Input: "& integer'image(to_integer(signed(inputTb)));
        report "Output: "& integer'image(to_integer(signed(outputTb)));
    else
        report "Test failed" severity error;
    end if;
    
    
    report "";
    report "Test 3";
    inputTb <= "1001";
    wait for 2 ns;

    if outputTb = "11111001" then
        report "Test succesfull";
        report "Input: "& integer'image(to_integer(signed(inputTb)));
        report "Output: "& integer'image(to_integer(signed(outputTb)));
    else
        report "Test failed" severity error;
    end if;
    
    report "";
    report "Test 4";
    inputTb <= "0011";
    wait for 2 ns;

    if outputTb = "00000011" then
        report "Test succesfull";
        report "Input: "& integer'image(to_integer(signed(inputTb)));
        report "Output: "& integer'image(to_integer(signed(outputTb)));
    else
        report "Test failed" severity error;
    end if;   
    
    report "";
    report "Test 5";
    inputTb <= "1000";
    wait for 2 ns;

    assert outputTb /= "00001000"
    report "Bad extend" severity failure;


    wait;
end process;
end architecture;