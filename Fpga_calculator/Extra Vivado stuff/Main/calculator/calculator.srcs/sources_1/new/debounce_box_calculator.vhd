library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity debounce_box_calculator is
    port(
     button: in std_logic;
     clk: in std_logic;
     outputs: out std_logic_vector(7 downto 0);
     Inputs: in std_logic_vector(7 downto 0)
    );
end entity;

architecture struct of debounce_box_calculator is

    --components

    component single_cycle_calculator is
        port(Inputs: in std_logic_vector(7 downto 0);
            clk: in std_logic;
            Outputs: out std_logic_vector(7 downto 0));      
    end component;
    

    component Debouncing_Button_VHDL is
        port(
         button: in std_logic;
         clk: in std_logic;
         debounced_button: out std_logic);
     end component;

    
    --signals
    signal button_clock_sig: std_logic; -- derived
    signal picker_in_sig: std_logic_vector (7 downto 0);

begin
-- port maps
butn: Debouncing_Button_VHDL
port map(button => button, clk => clk, debounced_button => button_clock_sig );

calc: single_cycle_calculator 
port map(Inputs => Inputs, clk => button_clock_sig, Outputs => outputs);

end architecture;

-- could add lights that show which bit is set
-- 