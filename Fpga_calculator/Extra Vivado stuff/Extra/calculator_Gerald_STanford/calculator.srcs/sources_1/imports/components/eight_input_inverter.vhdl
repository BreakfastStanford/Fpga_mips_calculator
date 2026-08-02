-- The inverter
-- Inverts a high or low signal
library ieee;
use ieee.std_logic_1164.all;

--entity section
entity eight_input_inverter is
    port(Input1: in std_logic_vector (7 downto 0); Output1: out std_logic_vector (7 downto 0)); --port identifiers
end eight_input_inverter;


-- architectural section
-- define the actual behavior of the logic circuit
architecture behaviour_inverter of eight_input_inverter is
begin
    Output1 <= not Input1; -- inversion worked without needing to go element by element
end behaviour_inverter;



-- signals are wires
-- they are inbetweens between the inputs and the outputs
-- std_vector represents related signals (a bus)
-- structural modeling vs behavioural modelding....code that isk only used for test benches
-- So the behavioral architectures seems to only focus on the behaviours and logic of the model....
-- and what needs to happen to the inputs to produce the outputs 

-- where as a structral model seems to be decribing the heiachry of actual components 
-- and how they a supposed to fit together. It doesn't treat the entity as a black box.
-- less concerned with behavioral logic and more concerned with how component interact with 
-- the system and what signals they affect

-- i guess that the reason an if else statement should be inside a process block is because they execute the internals sequentially