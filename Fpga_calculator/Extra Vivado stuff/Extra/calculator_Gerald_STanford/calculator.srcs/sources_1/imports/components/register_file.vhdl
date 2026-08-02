library ieee;
use ieee.std_logic_1164.all;

entity register_file is
    port(
        rs1, rs2, ws: in std_logic_vector(1 downto 0);
        wd: in std_logic_vector (7 downto 0);
        clock: in std_logic;
        enable: in std_logic;
        rd1, rd2: out std_logic_vector (7 downto 0));
end entity;

architecture behav of register_file is  
signal reg0, reg1, reg2, reg3: std_logic_vector(7 downto 0) := (others => '0');

begin
   
    -- determines what and when signals are assigned   
   Clk: process(clock)
    begin

    if(rising_edge(clock) and enable = '1') then
        if ws = "00" then
            reg0 <= wd;
        elsif ws = "01" then
            reg1 <= wd;
        elsif ws = "10" then
            reg2 <= wd;
        elsif ws = "11" then
            reg3 <= wd;
        end if;  
    end if;

    end process Clk;

   -- determines which signals are sent as output 
   reg1_output: process(rs1, clock) is
    begin
        if rs1 = "00" then
            rd1 <= reg0;
        elsif rs1 = "01" then
            rd1 <= reg1;
        elsif rs1 = "10" then
            rd1 <= reg2;
        elsif rs1 = "11" then
            rd1 <= reg3;
        else
            rd1 <= (others => '0');
        end if;
    end process reg1_output;   
    

    reg2_output: process(rs2, clock) is
        begin
            if rs2 = "00" then
                rd2 <= reg0;
            elsif rs2 = "01" then
                rd2 <= reg1;
            elsif rs2 = "10" then
                rd2 <= reg2;
            elsif rs2 = "11" then
                rd2 <= reg3;
            else
                rd2 <= (others => '0');
            end if;        
        end process reg2_output;  
end architecture;