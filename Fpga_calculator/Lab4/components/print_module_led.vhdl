library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity print_module_led is
    port( Number: in std_logic_vector(7 downto 0);
          LED_out: out std_logic_vector(7 downto 0); 
        enable: in std_logic;
        nop: in std_logic_vector(7 downto 0);
        clk: in std_logic);
end entity;



architecture behav_print of print_module_led is 
  signal saved_state: std_logic_vector(7 downto 0) := (others => '0');
begin
    
    -- dont need an intermediate value... the previous value of outputs is retained
    -- and only changed when enable is one
    process(clk) is
      begin
        if rising_edge(clk) then
            if enable = '1' and nop /= "00000000" then
              saved_state <= Number;
              LED_out <= Number;
            elsif enable = '0' and nop /= "00000000" then
              LED_out <= saved_state;
            elsif nop = "00000000"  then
              LED_out <= (others => '0');
            else
              LED_out <= saved_state;
            end if;
        end if;
      end process;
  

end architecture;

--behaviour
-- update led values only if enable is set to 1
-- if enable not 1, retain previous value

--added changes to make it only update on clock rise
-- go blank on nop and return
