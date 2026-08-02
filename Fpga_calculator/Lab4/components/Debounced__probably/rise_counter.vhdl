library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity rise_counter is
    port(clock: in std_logic;
         output_1: out std_logic_vector(7 downto 0));
end entity;

architecture behav of rise_counter is
    signal counter: std_logic_vector(7 downto 0) := (others => '0');
begin

    process (clock) is
      variable currentC: std_logic_vector(7 downto 0);
    begin
        if rising_edge(clock) then
            currentC :=  std_logic_vector(signed(counter) + 1 );
            counter <= currentC;
            output_1 <=  counter;
        end if;    
    end process;

end architecture;