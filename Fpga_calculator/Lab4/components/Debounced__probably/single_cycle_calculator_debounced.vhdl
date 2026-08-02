library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_cycle_calculator is
    port(Inputs: in std_logic_vector(7 downto 0);
        clk: in std_logic;
        Outputs: out std_logic_vector(7 downto 0);
        btnC: in std_logic );
        
end entity;


architecture struct_calc of single_cycle_calculator is

    -- constants
    constant DWidth: integer := 8;

--components

    --int picker
    component instruction_picker_two is
        port(User_Input: in std_logic_vector(7 downto 0);
            jump_bit, branch_bit, set_bit: in std_logic;
            clock: in std_logic;
            Output_1: out std_logic_vector(7 downto 0));
    end component;

    -- twos complement
    component twos_complement_circuit is
        port(Input1, Input2: in std_logic_vector(7 downto 0);
            Output1, Output2: out std_logic_vector(7 downto 0);
            SelT: in std_logic);
    end component;
    
    
    -- sign extender
    component sign_extender is
        port(Input1: in std_logic_vector(3 downto 0);
            Output1: out std_logic_vector(7 downto 0));
    end component;
    
    -- write back data mux    
    component two_input_Mux is
        generic(DataWidth: integer); 
            port(Input1, Input2: in std_logic_vector (DataWidth-1 downto 0); -- if data width is 1 then input busses will be 1 bit
                Sel: in std_logic;
                OutputD : out std_logic_vector (DataWidth-1 downto 0)); 
    end component;

    -- register file
    component register_file is
        port(
            rs1, rs2, ws: in std_logic_vector(1 downto 0);
            wd: in std_logic_vector (7 downto 0);
            clock: in std_logic;
            enable: in std_logic;
            rd1, rd2: out std_logic_vector (7 downto 0));
    end component;

    -- control unit
    component control_unit is
        port(InputOP: in std_logic_vector(3 downto 0);
        we, wdx, inx, alu, pri, jb, bb: out std_logic);
    end component;

    -- alu logic unit
    component alu_logic_unit is
        port(Input1: in std_logic_vector(4 downto 0);
        Output1: out std_logic_vector(2 downto 0));
    end component;

    -- alu
    component alu is
        port(Input1, Input2: in std_logic_vector(7 downto 0);
        op: in std_logic_vector(2 downto 0);
        Output1: out std_logic_vector(7 downto 0);
        set: out std_logic);
    end component;

    -- print module
   -- component print_module is
   --     port(Input1: in std_logic_vector(7 downto 0);
   --         enable: in std_logic);
   -- end component;
   component print_module_led is
    port( Number: in std_logic_vector(7 downto 0);
          LED_out: out std_logic_vector(7 downto 0); 
        enable: in std_logic);
    end component;



component Debouncing_Button_VHDL is
port(
 button: in std_logic;
 clk: in std_logic;
 debounced_button: out std_logic
);
end component;

    
     --signals/ wires
-- newset
signal sigInstOut: std_logic_vector(7 downto 0);
signal sigSignExtend: std_logic_vector(7 downto 0);
signal sigwriteDataMux: std_logic_vector(7 downto 0);
signal sigWe, sigWdx, sigAlu, sigPri, sigInx, sigJb, sigBb: std_logic; 
signal sigReg1, sigReg2: std_logic_vector(7 downto 0);
signal sigTwos1, sigTwos2: std_logic_vector(7 downto 0);        
signal sigAluLogic: std_logic_vector(2 downto 0);
signal sigSetOnEqual: std_logic;
signal sigAluResult: std_logic_vector(7 downto 0);  

signal sigButtonClock: std_logic;
--connects to:
-- instuction picker
-- reg_file
begin

debounce: Debouncing_Button_VHDL
port map(button => btnC, clk => clk, debounced_button => sigButtonClock);

instruction: instruction_picker_two
port map(User_Input => Inputs, clock => sigButtonClock, jump_bit => sigJb, branch_bit => sigBb, Output_1 => sigInstOut, set_bit => sigSetOnEqual );


reg_file: register_file 
port map(rs1 => sigInstOut(5 downto 4), rs2 => sigInstOut(3 downto 2), ws => sigInstOut(1 downto 0),
 wd => sigwriteDataMux, rd1 => sigReg1, rd2 => sigReg2, clock => sigButtonClock, enable => sigWe);

sign_ex: sign_extender port map(Input1 => sigInstOut(5 downto 2), Output1 => sigSignExtend);


wd_mux: two_input_Mux generic map ( DataWidth => DWidth)
port map(Input1 => sigSignExtend, Input2 => sigAluResult, OutputD => sigwriteDataMux, Sel => sigWdx);


 cu: control_unit 
 port map(InputOP => sigInstOut(7 downto 4), we=> sigWe, wdx=> sigWdx, inx => sigInx ,alu => sigAlu, pri => sigPri, jb=> sigJb, bb => sigBb );



twos: twos_complement_circuit 
port map(Input1 => sigReg1, Input2 => sigReg2, Output1 => sigTwos1, Output2 => sigTwos2, SelT => sigInx);



 alu_logic: alu_logic_unit 
 port map(Input1(4 downto 3) => sigInstOut(7 downto 6), Input1(2 downto 1) => sigInstOut(1 downto 0), 
 Input1(0) => sigAlu,  Output1 => sigAluLogic);

alu_op: alu port map(Input1 => sigTwos1, Input2 => sigTwos2, op => sigAluLogic, set => sigSetOnEqual, Output1 => sigAluResult);
 
--print: print_module port map(Input1 => sig9, enable => sig6);
print: print_module_led port map(Number => sigReg2, enable => sigPri, LED_out => Outputs);



end architecture;