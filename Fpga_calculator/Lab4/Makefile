calc:
	@ghdl -a --ieee=standard single_cycle_calculator.vhdl
	@ghdl -a --ieee=standard components/register_file.vhdl
	@ghdl -a --ieee=standard components/print_module.vhdl
	@ghdl -a --ieee=standard components/alu.vhdl
	@ghdl -a --ieee=standard components/alu_logic_unit.vhdl
	@ghdl -a --ieee=standard testbenches/control_unitTb.vhdl
	@ghdl -a --ieee=standard components/sign_extender.vhdl
	@ghdl -a --ieee=standard components/sign_extender.vhdl
	@ghdl -a --ieee=standard components/twos_complement_circuit.vhdl
	@ghdl -a --ieee=standard single_cycle_calculatorTb.vhdl
	@ghdl -e --ieee=standard single_cycle_calculatorTb 
	@ghdl -r single_cycle_calculatorTb  --wave=waveforms/calcwave.ghw --stop-time=1us
	gtkwave waveforms/calcwave.ghw


andgate:
	@ghdl -a --ieee=standard components/two_input_eight_width_and_gate.vhdl
	@ghdl -a --ieee=standard testbenches/two_input_eight_width_and_gateTb.vhdl
	@ghdl -e --ieee=standard two_input_eight_width_and_gateTb
	@ghdl -r two_input_eight_width_and_gateTb --wave=waveforms/andgatewave.ghw --stop-time=1us
	gtkwave waveforms/andgatewave.ghw

inverter:
	@ghdl -a --ieee=standard components/eight_input_inverter.vhdl
	@ghdl -a --ieee=standard testbenches/eight_input_inverterTb.vhdl
	@ghdl -e --ieee=standard eight_input_inverterTb
	@ghdl -r eight_input_inverterTb --wave=waveforms/inverterwave.ghw --stop-time=1us


mux:
	@ghdl -a --ieee=standard components/two_input_Mux.vhdl
	@ghdl -a --ieee=standard testbenches/two_input_MuxTb.vhdl
	@ghdl -e --ieee=standard two_input_MuxTb
	@ghdl -r two_input_MuxTb --wave=waveforms/muxwave.ghw --stop-time=1us


sign_extend:
	@ghdl -a --ieee=standard components/sign_extender.vhdl
	@ghdl -a --ieee=standard testbenches/sign_extenderTb.vhdl
	@ghdl -e --ieee=standard sign_extenderTb 
	@ghdl -r sign_extenderTb --wave=waveforms/signextendwave.ghw --stop-time=1us
	gtkwave waveforms/signextendwave.ghw

adder:
	@ghdl -a --ieee=standard components/plus_n_adder_nocarry.vhdl
	@ghdl -a --ieee=standard testbenches/plus_n_adder_nocarryTb.vhdl
	@ghdl -e --ieee=standard plus_n_adder_nocarryTb 
	@ghdl -r plus_n_adder_nocarryTb --wave=waveforms/adderwave.ghw --stop-time=1us
	gtkwave waveforms/adderwave.ghw


twos:
	@ghdl -a --ieee=standard components/twos_complement_circuit.vhdl
	@ghdl -a --ieee=standard components/two_input_eight_width_and_gate.vhdl
	@ghdl -a --ieee=standard components/eight_input_inverter.vhdl
	@ghdl -a --ieee=standard components/two_input_Mux.vhdl
	@ghdl -a --ieee=standard components/plus_n_adder_nocarry.vhdl
	@ghdl -a --ieee=standard testbenches/twos_complement_circuitTb.vhdl
	@ghdl -e --ieee=standard twos_complement_circuitTb 
	@ghdl -r twos_complement_circuitTb --wave=waveforms/twoswave.ghw --stop-time=1us
	gtkwave waveforms/twoswave.ghw

control:
	@ghdl -a --ieee=standard components/control_unit.vhdl
	@ghdl -a --ieee=standard testbenches/control_unitTb.vhdl
	@ghdl -e --ieee=standard control_unitTb
	@ghdl -r control_unitTb --wave=waveforms/controlwave.ghw --stop-time=1us
	gtkwave waveforms/controlwave.ghw

alu_logic:
	@ghdl -a --ieee=standard components/alu_logic_unit.vhdl
	@ghdl -a --ieee=standard testbenches/alu_logic_unitTb.vhdl
	@ghdl -e --ieee=standard alu_logic_unitTb 
	@ghdl -r alu_logic_unitTb  --wave=waveforms/alulogicwave.ghw --stop-time=1us
	gtkwave waveforms/alulogicwave.ghw

alu:
	@ghdl -a --ieee=standard components/alu.vhdl
	@ghdl -a --ieee=standard testbenches/aluTb.vhdl
	@ghdl -e --ieee=standard aluTb
	@ghdl -r aluTb --wave=waveforms/aluwave.ghw --stop-time=1us
	gtkwave waveforms/aluwave.ghw

reg:
	@ghdl -a --ieee=standard components/eight_bit_register.vhdl
	@ghdl -a --ieee=standard testbenches/eight_bit_registerTb.vhdl
	@ghdl -e --ieee=standard eight_bit_registerTb
	@ghdl -r eight_bit_registerTb --wave=waveforms/registerwave.ghw --stop-time=1us
	gtkwave waveforms/registerwave.ghw

regfile:
	@ghdl -a --ieee=standard components/register_file.vhdl
	@ghdl -a --ieee=standard testbenches/register_fileTb.vhdl
	@ghdl -e --ieee=standard register_fileTb
	@ghdl -r register_fileTb --wave=waveforms/registerfilewave.ghw --stop-time=1us
	gtkwave waveforms/registerfilewave.ghw

print:
	@ghdl -a --ieee=standard components/print_module.vhdl
	@ghdl -a --ieee=standard testbenches/print_moduleTb.vhdl
	@ghdl -e --ieee=standard print_moduleTb
	@ghdl -r print_moduleTb --wave=waveforms/printwave.ghw --stop-time=1us
	gtkwave waveforms/printwave.ghw

inst:
	@ghdl -a --ieee=standard components/instruction_picker.vhdl
	@ghdl -a --ieee=standard testbenches/instruction_picker_tb.vhdl
	@ghdl -e --ieee=standard instruction_picker_tb
	
instt:
	@ghdl -a --ieee=standard components/instruction_picker_two.vhdl

	