library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_fileTb is
end entity;

architecture sim of register_fileTb is

    --signals
signal rsTb1, rsTb2, wsTb: std_logic_vector(1 downto 0);
signal wdTb, rdTb1, rdTb2: std_logic_vector(7 downto 0);
signal clockTb, enableTb: std_logic;

    --components
    component register_file is
        port(
            rs1, rs2, ws: in std_logic_vector(1 downto 0);
            wd: in std_logic_vector (7 downto 0);
            clock: in std_logic;
            enable: in std_logic;
            rd1, rd2: out std_logic_vector (7 downto 0));
    end component;



        -- declare a record type to hold testing values
type testing_values is record
--rs1: std_logic_vector(1 downto 0);
--rs2: std_logic_vector(1 downto 0);
ws: std_logic_vector(1 downto 0);
wd: std_logic_vector(7 downto 0);
--rd1: std_logic_vector(7 downto 0);
--rd2: std_logic_vector(7 downto 0);
c: std_logic;
e: std_logic;
end record testing_values;

-- declare array of testing values
type testing_array is array (natural range <>) of testing_values;

-- instance of array
constant testing_array_inst: testing_array :=
(
("00", "00000000", '0', '0'), --n
("00", "00000001", '1', '1'),
("01", "00000011", '0', '1'),   
("01", "00000011", '1', '1'),
("11", "00000011", '0', '0'),
("11", "00000111", '1', '0'),
("11", "00000111", '1', '1'),
("11", "00000111", '0', '1'),
("11", "00000111", '1', '1'), 
("01", "00000111", '0', '0'),
("01", "00000101", '1', '1'),  
("01", "00000101", '0', '1'),    
("10", "00010101", '1', '0'),
("00", "00010101", '0', '1'),  
("10", "00010101", '1', '1')              
);






begin
    -- portmap
rfile: register_file 
port map(rs1 => rsTb1, rs2 => rsTb2, ws => wsTb, wd => wdTb, 
rd1 => rdTb1, rd2 => rdTb2, clock => clockTb, enable => enableTb);



--clk:process(clockTb) is
 --   begin
  --      if(rising_edge(clockTb) and enableTb = '1') then
   --         assign := true;
   --     else
   --         assign := false;
   ----     end if; 
   -- end process clk;
-------------------------------------------
  
--------------------------------------
control: process is
    variable rValue0, rValue1, rValue2, rValue3: std_logic_vector(7 downto 0) := (others => '0'); 
    variable assign: boolean := false;
    begin
        
        for i in testing_array_inst'range loop

            -- drive values
            report "test index "& integer'image(i);
            wsTb <= testing_array_inst(i).ws;
            wdTb <= testing_array_inst(i).wd;
            clockTb <= testing_array_inst(i).c;
            enableTb <= testing_array_inst(i).e;
            wait for 10 ns;
            -- assign a new value to a specific variable based on conditions
            if assign = true then
                report "assing is true";
                if wsTb = "00" then
                    rValue0 := wdTb;
                elsif wsTb = "01" then
                    rValue1 := wdTb;
                elsif wsTb = "10" then
                    rValue2 := wdTb;
                elsif wsTb = "11" then
                    rValue3 := wdTb;
                end if;  
            end if;
           -- report "r0: "& integer'image(to_integer(signed(rValue0)));
           -- report "r1: "& integer'image(to_integer(signed(rValue0)));
           -- report "r2: "& integer'image(to_integer(signed(rValue0)));
           -- report "r3: "& integer'image(to_integer(signed(rValue0)));
            -- test rd values
            rsTb1 <= "00";
            
            rsTb2 <= "01";
            wait for 5 ns;
         
           report "r0: "& integer'image(to_integer(signed(rdTb1)));
            report "r1: "& integer'image(to_integer(signed(rdTb2)));
            rsTb1 <= "10"; 
            rsTb2 <= "11";
            wait for 5 ns;
            report "r2: "& integer'image(to_integer(signed(rdTb1)));
            report "r3: "& integer'image(to_integer(signed(rdTb2)));


            
           -- if outputTb = testing_array_inst(i).o then
           --     report "Test succesful";
           -- else
           --     report "Bad Result" severity failure;
           -- end if;
           -- report "Input1: "& integer'image(to_integer(unsigned(inputTb))); 
           --- report "Output: "& integer'image(to_integer(unsigned(outputTb)));
          --  report "clock: "& std_logic'image(clockTb);
           -- report "enableBit: "& std_logic'image(enableTb);
           -- report "";    
            
        end loop;
        wait;
    end process;


end architecture;


-- run test array and drive values 
-- assign a new value to a specific variable based on conditions
-- drive each rs to a diffrent value and compare the rd1 with the variable