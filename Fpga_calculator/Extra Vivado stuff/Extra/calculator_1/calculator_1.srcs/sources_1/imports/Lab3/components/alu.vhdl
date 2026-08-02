library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(Input1, Input2: in std_logic_vector(7 downto 0);
        op: in std_logic_vector(1 downto 0);
        Output1: out std_logic_vector(7 downto 0);
        set: out std_logic);
end entity;

architecture behaviour_alu of alu is 
begin
    process(Input1, Input2, op) is
        variable outputOld: std_logic_vector(7 downto 0) := (others => '0');
        variable setOld: std_logic := '0';
    begin

        if op = "00" then   --add
            outputOld := std_logic_vector(signed(Input1) + signed(Input2));
            Output1 <= outputOld;
            set <= setOld;

        elsif op = "01" then  --subtract
            outputOld :=std_logic_vector(signed(Input1) - signed(Input2));
            Output1 <= outputOld;
            set <= setOld;

        elsif op = "10" then    --nothing 
            Output1 <= outputOld;
            set <= setOld; 

        elsif op = "11" then    -- set on equal
            outputOld := std_logic_vector(signed(Input1) - signed(Input2));
            Output1 <= outputOld;
            if Input1 = Input2 then
                setOld := '1';
            else 
                setOld := '0';
            end if;
            set <= setOld;

        end if;


    end process;

end architecture;