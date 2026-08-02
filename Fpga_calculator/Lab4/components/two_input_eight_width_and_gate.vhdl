--declarations
library ieee;
use ieee.std_logic_1164.all;


entity two_input_eight_width_and_gate is
    port(Input1, Input2: in std_logic_vector(7 downto 0); Output1: out std_logic_vector(7 downto 0));
end two_input_eight_width_and_gate;

architecture behaviour_and_gate of two_input_eight_width_and_gate  is
begin
    Output1(0) <= Input1(0) and Input2(0);
    Output1(1) <= Input1(1) and Input2(1);
    Output1(2) <= Input1(2) and Input2(2);
    Output1(3) <= Input1(3) and Input2(3);
    Output1(4) <= Input1(4) and Input2(4);
    Output1(5) <= Input1(5) and Input2(5);
    Output1(6) <= Input1(6) and Input2(6);
    Output1(7) <= Input1(7) and Input2(7);
end behaviour_and_gate;