library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- uses the generics to determine signal bus widths
entity two_input_Mux is
    generic(DataWidth: integer); 
        port(Input1, Input2: in std_logic_vector (DataWidth-1 downto 0); -- if data width is 1 then input busses will be 1 bit
            Sel: in std_logic;
            OutputD : out std_logic_vector (DataWidth-1 downto 0)); 
end entity two_input_Mux;


architecture behaviour_mux of two_input_Mux is
begin
    Selection : process(Input1, Input2, Sel) is    -- process runs when DataSel changes
    begin   
        if (Sel = '0') then
            OutputD <= Input1;
        elsif (Sel = '1') then
            OutputD <= Input2;
        else
            OutputD <= (others => '0');
        end if;
        
    end process Selection;
end architecture;


