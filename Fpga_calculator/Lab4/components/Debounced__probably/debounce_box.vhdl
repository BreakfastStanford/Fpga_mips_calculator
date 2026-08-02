library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity debounce_box is
    port(
     button: in std_logic;
     clk: in std_logic;
     outputs: out std_logic_vector(7 downto 0)
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

    component rise_counter is
        port(clock: in std_logic;
             output_1: out std_logic_vector(7 downto 0));
    end component;

    --signals
    signal button_clock_sig: std_logic; 

begin
-- port maps
butn: Debouncing_Button_VHDL
port map(button => button, clk => clk, debounced_button => button_clock_sig );

counter: rise_counter
port map(clock => button_clock_sig, output_1 => outputs );

end architecture;