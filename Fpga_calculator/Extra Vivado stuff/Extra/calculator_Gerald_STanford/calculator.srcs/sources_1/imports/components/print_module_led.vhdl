library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_module_led is
    port( Number: in std_logic_vector(7 downto 0);
          LED_out: out std_logic_vector(7 downto 0); 
        enable: in std_logic);
end entity;



architecture behav_print of print_module_led is
 signal led: std_logic_vector(7 downto 0);   
begin

    process(Number) is
        begin
            if enable = '1' then
              led <= Number;
            end if;
        end process;
    
    LED_out <= led;

end architecture;
