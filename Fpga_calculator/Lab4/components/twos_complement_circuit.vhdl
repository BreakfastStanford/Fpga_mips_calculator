library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity twos_complement_circuit is
    port(Input1, Input2: in std_logic_vector(7 downto 0);
        Output1, Output2: out std_logic_vector(7 downto 0);
        SelT: in std_logic);
end entity;

architecture struct_twos of twos_complement_circuit is

    --constants
    constant DataWidth: integer := 8;
    constant Cvalue: std_logic_vector(7 downto 0) := "00000001";

    --components
    -- adder
    component plus_n_adder_nocarry is
        generic(DataWidth: integer); 
        port(Input1, Input2: in std_logic_vector(DataWidth-1 downto 0);
            Output1: out std_logic_vector(DataWidth-1 downto 0));
    end component;
    
    -- and gates
    component two_input_eight_width_and_gate is
        port(Input1, Input2: in std_logic_vector(7 downto 0);
            Output1: out std_logic_vector(7 downto 0));
    end component;
    
    --multiplexors
    component two_input_Mux is
        generic(DataWidth: integer); 
            port(Input1, Input2: in std_logic_vector (DataWidth-1 downto 0); -- if data width is 1 then input busses will be 1 bit
                Sel: in std_logic;
                OutputD : out std_logic_vector (DataWidth-1 downto 0)); 
    end component;
    
    -- inverters    
    component eight_input_inverter is
        port(Input1: in std_logic_vector (7 downto 0); Output1: out std_logic_vector (7 downto 0)); --port identifiers
    end component;
    
    --signals/ wires
    signal sig1, sig2, sig3, sig4, sigC: std_logic_vector(7 downto 0);
begin
    sigC <= Cvalue;
    inv1: eight_input_inverter port map(Input1, sig1);
    inv2: eight_input_inverter port map(Input2, sig4);
    andg: two_input_eight_width_and_gate port map(Input1 => Input1, Input2 => sig1, Output1 => sig2);
    adder:  plus_n_adder_nocarry
            generic map ( DataWidth => DataWidth)
            port map(Input1 => sigC, Input2 => sig2, Output1 => sig3);
    mux1:   two_input_Mux 
            generic map(DataWidth => DataWidth)
            port map(Input1 => Input1, Input2 => sig3, OutputD => Output1, Sel => SelT);
    mux2:   two_input_Mux 
            generic map(DataWidth => DataWidth)
            port map(Input1 => Input2, Input2 => sig4, OutputD => Output2, Sel => SelT);

end architecture;