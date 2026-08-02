library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity print_module_led is
    port( Number: in std_logic_vector(7 downto 0);
          LED_out: out std_logic_vector(7 downto 0); 
        enable: in std_logic);
end entity;



architecture behav_print of print_module_led is 
begin
    
    -- dont need an intermediate value... the previous value of outputs is retained
    -- and only changed when enable is one
    process(Number, enable) is
        begin
            if enable = '1' then
              LED_out <= Number;
            end if;
        end process;


end architecture;

--behaviour
-- update led values only if enable is set to 1
-- if enable not 1, retain previous value
