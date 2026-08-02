library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_picker_two is
    port(User_Input: in std_logic_vector(7 downto 0);
        jump_bit, branch_bit, set_bit: in std_logic;
        clock: in std_logic;
        Output_1: out std_logic_vector(7 downto 0));
end entity;


architecture behaviour of instruction_picker_two is 
    signal branch_st: std_logic;
    signal jump_st: std_logic;
    signal set_st: std_logic;
begin

assign: process(clock) is
    begin
        if rising_edge(clock) then
            
            branch_st <= branch_bit;
            jump_st <= jump_bit;
            set_st <= set_bit; 
        end if;    

    end process;

pickoutput: process(clock) is
    begin 

    if branch_st = '0' and jump_st = '0' then
        Output_1 <= User_Input;
    elsif branch_st = '1' and jump_st = '0' and set_st = '1' then
        Output_1 <= "00110000";  -- print 00
    elsif branch_st = '0' and jump_st = '1' and set_st = '1' then
        Output_1 <= "00000000"; -- nop
    else
        Output_1 <= User_Input;

    end if;  
    end process;     

end architecture;




-- jump bit and branch bit come from control, while set comes from alu