library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extender is
    port(Input1: in std_logic_vector(3 downto 0);
        Output1: out std_logic_vector(7 downto 0));
end sign_extender;

architecture behaviour_ext of sign_extender is
begin
ext: process (Input1) is
    begin

        if Input1(3) = '0' then
            for i in Output1'range loop
                if i > Input1'length -1 then
                    Output1(i) <= '0';
                else      
                    Output1(i) <= Input1(i); 
                end if;
            end loop;
        elsif Input1(3) = '1' then
            for i in Output1'range loop
                if i > Input1'length -1  then
                    Output1(i) <= '1';
                else      
                    Output1(i) <= Input1(i); 
                end if;
            end loop;
        else
                    
        end if;        
     
        
    end process;
end behaviour_ext;