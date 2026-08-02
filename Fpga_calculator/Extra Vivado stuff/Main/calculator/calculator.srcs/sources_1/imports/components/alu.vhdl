library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(Input1, Input2: in std_logic_vector(7 downto 0);
        op: in std_logic_vector(2 downto 0);
        Output1: out std_logic_vector(7 downto 0);
        set: out std_logic);
end entity;

architecture behaviour_alu of alu is 
begin
    process(Input1, Input2, op) is
    begin

        if op = "000" then   --add
            Output1 <=  std_logic_vector(signed(Input1) + signed(Input2));
            set <= '0';

        elsif op = "001" then  --subtract
            Output1 <=  std_logic_vector(signed(Input1) + signed(Input2));
            set <= '0';

        elsif op = "010" then    --nothing 
            Output1 <= (others => '0');
            set <= '0'; 

        elsif op = "011" then    -- set on equal
        
            Output1 <= std_logic_vector(signed(Input1) - signed(Input2));
            if Input1 = Input2 then
                set <= '1';
            else 
                set <= '0';
            end if;
        elsif op = "100" then
            Output1 <= (others => '0');
            set <= '1';     
        else
            Output1 <= (others => '0');
            set <= '0';   
        end if;
    end process;

end architecture;