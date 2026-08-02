library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_module is
    port( Number: in std_logic_vector(7 downto 0);
        enable: in std_logic;
        clock: in std_logic;
        anodes: out std_logic_vector(3 downto 0);
        cathodes: out std_logic_vector(6 downto 0));
end entity;



architecture behav_print of print_module is
    
    -- declare types
    subtype digit_type is integer range 0 to 9;
    type digits_type is array (2 downto 0) of digit_type;
    signal digits : digits_type;
    signal digit : digit_type;


    -- signals
    signal outputN: std_logic_vector (7 downto 0);
    signal sign_bit: std_logic;
    --signal NumberToInt: integer;
    
    -- i need a set signal?
    subtype picker_type is integer range 0 to 3;
    signal anode_picker: integer := 0;
    
begin


bcd: process(Number) is
      variable NumberToInt: integer := to_integer(signed(Number));
    begin
      

       if Number(7) = '0' then
            sign_bit <= '0';

            if NumberToInt >= 100 then
                -- find hundreds
                digits(2) <= NumberToInt / 100;
                digits(1) <= (NumberToInt / 100) - 10;
                digits(0) <= NumberToInt - ((NumberToInt / 10) * 10);
            elsif NumberToInt < 100 AND NumberToInt >= 10 then
                digits(2) <= 0;
                digits(1) <= (NumberToInt / 10);
                digits(0) <= NumberToInt - ((NumberToInt / 10) * 10);
            elsif NumberToInt < 10 then
                digits(2) <= 0;
                digits(1) <= 0;
                digits(0) <= NumberToInt;
            end if;    
        elsif Number(7) = '1' then
            sign_bit <= '1';

            if NumberToInt <= -100 then
                -- find hundreds
                digits(2) <= NumberToInt / 100;
                digits(1) <= (NumberToInt / 100) - 10;
                digits(0) <= NumberToInt- ((NumberToInt / 10) * 10);
            elsif NumberToInt > -100 AND NumberToInt <= -10 then
                digits(2) <= 0;
                digits(1) <= (NumberToInt / 10);
                digits(0) <= NumberToInt - ((NumberToInt / 10) * 10);
            elsif NumberToInt > -10 then
                digits(2) <= 0;
                digits(1) <= 0;
                digits(0) <= NumberToInt;
            end if;    


          end if;
    end process;
    
anode_pic: process(clock) is
    begin
        if rising_edge(clock) then
            anode_picker <= anode_picker + 1;       
        end if;

    end process;



Light_segments: process(clock) is
    begin
        if rising_edge(clock) then
            if enable = '1' then
            case anode_picker is
            when 0 =>
                anodes <= "1000";
            when 1 =>
                anodes <= "0100";
                digit <= digits(2);    
            
            when 2 =>
                anodes <= "0010";
                digit <= digits(1);
            when 3 =>
                anodes <= "0001";
                digit <= digits(0);
            end case;
            end if;
                
        end if;        

    end process;



numbers: process(digit) is 
    begin
      case digit is
     
        when 0 => cathodes <= "0111111";
        when 1 => cathodes <= "0000110";
        when 2 => cathodes <= "1011011";
        when 3 => cathodes <= "1001111";
        when 4 => cathodes <= "1100110";
        when 5 => cathodes <= "1101101";
        when 6 => cathodes <= "1111101";
        when 7 => cathodes <= "0000111";
        when 8 => cathodes <= "1111111";
        when 9 => cathodes <= "1101111";
       
        end case;
    end process; 
    
sign  : process(sign_bit) is
    begin
      case digit is
     
        when '0' => cathodes <= "0000000";
        when '1' => cathodes <= "0000110";
    
        end case;
    end process;   
end architecture;



-- what i need to constrain
-- 8 switches

-------- in actual design clock will be button, enable will be decided by control unit
-- clock
-- enable 
-- seven segment display leds