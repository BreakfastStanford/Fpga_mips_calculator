library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_register is
    port(Input1: in std_logic_vector(7 downto 0) := (others => '0');
        Output1: out std_logic_vector (7 downto 0) := (others => '0');
        clock: in std_logic;
        enable: in std_logic);
end entity;

architecture behav of eight_bit_register is  
begin
   Clk: process(clock)
    begin

    if(rising_edge(clock)) then
        if (enable = '1') then
            Output1 <= Input1;
        end if;    
    end if;

    end process Clk;
end architecture;