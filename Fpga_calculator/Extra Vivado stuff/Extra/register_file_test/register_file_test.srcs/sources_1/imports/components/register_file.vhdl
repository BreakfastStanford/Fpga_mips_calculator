library ieee;
use ieee.std_logic_1164.all;

entity register_file is
    port(
        writeDest: in std_logic_vector(1 downto 0);
        readPort: in std_logic_vector(1 downto 0);
        data: in std_logic_vector (7 downto 0);
        clock: in std_logic;
        enable: in std_logic;
        output: out std_logic_vector (7 downto 0));
end entity;

architecture behav of register_file is  
signal reg0, reg1, reg2, reg3: std_logic_vector(7 downto 0) := (others => '0');

begin
   
    -- determines what and when signals are assigned
    -- moves the designated input value into storage   
   Clk: process(clock)
    begin

    if(rising_edge(clock) and enable = '1') then
        if writeDest = "00" then
            reg0 <=  data;
        elsif writeDest = "01" then
            reg1 <=  data;
        elsif writeDest = "10" then
            reg2 <=  data;
        elsif writeDest = "11" then
            reg3 <=  data;
        end if;  
    end if;

    end process Clk;

   -- determines which signals are sent as output 
   reg1_output: process(readPort, reg1, reg2, reg3, reg3) is
    begin
        if readPort = "00" then
            output <= reg0;
        elsif readPort = "01" then
            output <= reg1;
        elsif readPort = "10" then
            output <= reg2;
        elsif readPort = "11" then
            output <= reg3;
        else
            output <= (others => '0');
        end if;
    end process reg1_output;   
    

 
end architecture;

-- able to pick a destination to write to
-- then the destination is written to by pressing the enable
-- set the correct readport to select that certain register and the stored value
-- appears on the LED