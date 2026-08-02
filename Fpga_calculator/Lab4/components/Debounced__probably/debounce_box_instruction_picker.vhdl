library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity debounce_box is
    port(
     button: in std_logic;
     clk: in std_logic;
     outputs: out std_logic_vector(7 downto 0);
     Inputs: in std_logic_vector(7 downto 0);
     j, b , s: in std_logic;
     js, bs, ss: out std_logic
    );
end entity;

architecture struct of debounce_box is

    --components
    component Debouncing_Button_VHDL is
        port(
         button: in std_logic;
         clk: in std_logic;
         debounced_button: out std_logic);
     end component;

     component instruction_picker_two is
        port(User_Input: in std_logic_vector(7 downto 0);
            jump_bit, branch_bit, set_bit: in std_logic;
            clock: in std_logic;
            Output_1: out std_logic_vector(7 downto 0);
            --test bits
            js, bs, ss: out std_logic
            );
    end component;
    
    
    
component simple_register is
    port(inputs: in std_logic_vector(7 downto 0);
    clock: in std_logic;
    outputs: out std_logic_vector(7 downto 0));

end component;
    
    --signals
    signal button_clock_sig: std_logic; -- derived
    signal picker_in_sig: std_logic_vector (7 downto 0);

begin
-- port maps
butn: Debouncing_Button_VHDL
port map(button => button, clk => clk, debounced_button => button_clock_sig );


picker: instruction_picker_two
port map (User_Input => Inputs, Jump_bit => j, branch_bit => b, set_bit => s, clock => button_clock_sig, Output_1 => picker_in_sig,
js => js, bs => bs, ss => ss);


reg: simple_register 
port map (inputs => picker_in_sig, clock => button_clock_sig, outputs => outputs);

end architecture;

-- could add lights that show which bit is set
-- 