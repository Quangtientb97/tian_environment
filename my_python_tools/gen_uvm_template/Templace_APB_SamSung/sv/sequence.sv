class __SUB__master_sequence_c extends uvm_sequence#(__SUB__master_trans_c);
	`uvm_object_utils(__SUB__master_sequence_c)
	`uvm_declare_p_sequencer(__SUB__master_sequencer_c)

	function new(string name="__SUB__master_sequence_c");
		super.new(name);
	endfunction

	// Declare base task and function
	// task write() `uvm_do_with(req, {addr == __ADDR__; data == __DATA__})
	// task read()
endclass

class __SUB__slave_sequence_c extends uvm_sequence#(__SUB__slave_trans_c);
	`uvm_object_utils(__SUB__slave_sequence_c)
	`uvm_declare_p_sequencer(__SUB__slave_sequencer_c)

	function new(string name="__SUB__slave_sequence_c");
		super.new(name);
	endfunction

	// Declare base task and function
	// task write() `uvm_do_with(req, {addr == __ADDR__; data == __DATA__})
	// task read()
endclass
