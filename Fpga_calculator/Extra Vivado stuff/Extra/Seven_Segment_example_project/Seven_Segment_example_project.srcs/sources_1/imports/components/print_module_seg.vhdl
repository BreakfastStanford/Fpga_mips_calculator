library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_module is
    port( sw: in std_logic_vector(7 downto 0);
--enable: in std_logic;
        clock_100Mhz: in std_logic;
        Anode_Activate: out std_logic_vector(3 downto 0);
        LED_out: out std_logic_vector(6 downto 0));
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
    signal anode_picker: integer:= 0;
    
begin


bcd: process(sw) is
      variable NumberToInt: integer := to_integer(signed(sw));
    begin
      

        if NumberToInt > 0 then
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
        elsif NumberToInt < 0 then
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
                
            else
                digits(2) <= 0;
                digits(1) <= 0;
                digits(0) <= 0;
                      
            end if;    

            
          end if;
    end process;
   

Light_segments: process(clock_100Mhz) is
    begin
        if rising_edge(clock_100Mhz) then
         anode_picker <= anode_picker + 1;  
           -- if enable = '1' then
            case anode_picker is
            when 0 =>
                Anode_Activate <= "1000";
                case sign_bit is
                    when '0' => LED_out <= "0000000";
                    when '1' => LED_out <= "0000110";
                     when others => LED_out <= "0000000";
                end case;
            when 1 =>
                Anode_Activate <= "0100";
                case digits(2) is
                    when 0 => LED_out <= "0111111";
                    when 1 => LED_out <= "0000110";
                    when 2 => LED_out <= "1011011";
                    when 3 => LED_out <= "1001111";
                    when 4 => LED_out <= "1100110";
                    when 5 => LED_out <= "1101101";
                    when 6 => LED_out <= "1111101";
                    when 7 => LED_out <= "0000111";
                    when 8 => LED_out <= "1111111";
                    when 9 => LED_out <= "1101111";
                    when others => LED_out <= "0000000";
                   
                end case;
            
            
            when 2 =>
                Anode_Activate <= "0010";
                case digits(1) is
                    when 0 => LED_out <= "0111111";
                    when 1 => LED_out <= "0000110";
                    when 2 => LED_out <= "1011011";
                    when 3 => LED_out <= "1001111";
                    when 4 => LED_out <= "1100110";
                    when 5 => LED_out <= "1101101";
                    when 6 => LED_out <= "1111101";
                    when 7 => LED_out <= "0000111";
                    when 8 => LED_out <= "1111111";
                    when 9 => LED_out <= "1101111";
                    when others => LED_out <= "0000000";
                end case;
            
            when 3 =>
                Anode_Activate <= "0001";
                case digits(0) is
                    when 0 => LED_out <= "0111111";
                    when 1 => LED_out <= "0000110";
                    when 2 => LED_out <= "1011011";
                    when 3 => LED_out <= "1001111";
                    when 4 => LED_out <= "1100110";
                    when 5 => LED_out <= "1101101";
                    when 6 => LED_out <= "1111101";
                    when 7 => LED_out <= "0000111";
                    when 8 => LED_out <= "1111111";
                    when 9 => LED_out <= "1101111";
                    when others => LED_out <= "0000000";
                end case;
              
             when others => LED_out <= "0000000";
            end case;
          --  end if;
                
        end if;        

    end process;


  
end architecture;



-- enable adds a slight complication
-- would need to be held in order for the segment to update
-- enable should trigger a signal that idk allows the the things to be written to
-- the segment will be on by default, but the enable should trigger the ability to change

-- a register file (implicit) could hold the values of the number to print
-- enable is the only way to write to the file
-- the file puts whatever values it has to the segment

-- signal numberfile: digit_type (3 donwnto 0) -> these are what is assigned to the seg... need a process(enable) to assign
-- and numbersign
