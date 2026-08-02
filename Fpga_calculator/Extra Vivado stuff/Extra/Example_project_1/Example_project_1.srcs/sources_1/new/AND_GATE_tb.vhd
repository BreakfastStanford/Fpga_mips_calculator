-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AND_GATE_tb is
end;

architecture bench of AND_GATE_tb is

  component AND_GATE
      Port ( In_1 : in STD_LOGIC;
             In_2 : in STD_LOGIC;
             Out_1 : out STD_LOGIC);
  end component;

  signal In_1: STD_LOGIC;
  signal In_2: STD_LOGIC;
  signal Out_1: STD_LOGIC;

begin

  uut: AND_GATE port map ( In_1  => In_1,
                           In_2  => In_2,
                           Out_1 => Out_1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    In_1 <= '0';
    In_2 <= '0';
    wait for 10 ns;
    --assert Out_1 = '0' report "Bad output" severity error;
    
    In_1 <= '1';
    In_2 <= '0';
    wait for 10 ns;
   -- assert Out_1 = '0' report "Bad output" severity error;
    
    In_1 <= '0';
    In_2 <= '1';
    wait for 10 ns;
  --  assert Out_1 = '0' report "Bad output" severity error;
    
    In_1 <= '1';
    In_2 <= '1';
    wait for 10 ns;
--assert Out_1 = '1' report "Bad output" severity error;
    
    In_1 <= '0';
    In_2 <= '0';
    wait for 10 ns;
    --assert Out_1 = '0' report "Bad output" severity error;

    -- Put test bench stimulus code here

    wait;
  end process;


end;