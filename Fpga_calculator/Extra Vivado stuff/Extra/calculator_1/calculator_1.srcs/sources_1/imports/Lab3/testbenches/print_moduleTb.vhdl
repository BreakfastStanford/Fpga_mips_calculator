library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_moduleTb is
end entity;

architecture behav_print of print_moduleTb is
    --signal
    signal inputTb: std_logic_vector(7 downto 0);
    signal enableTb: std_logic;

    --component
    component print_module is
        port(Input1: in std_logic_vector(7 downto 0);
            enable: in std_logic);
    end component;
begin
-- portmap 
print: print_module port map(Input1 => inputTb, enable => enableTb);
    process is
    begin
        inputTb <= "00000010";
        enableTb <= '1';
        wait for 2 ns;

        inputTb <= "10000010";
        enableTb <= '0';
        wait for 2 ns;

        inputTb <= "00000011";
        enableTb <= '1';
        wait for 2 ns;

        inputTb <= "10000001";
        enableTb <= '1';
        wait for 2 ns;

        inputTb <= "00101001";
        enableTb <= '0';
        wait for 2 ns;

        wait;
    end process;
end architecture;