`ifndef __SEQS_LIB__
`define __SEQS_LIB__

//------------------------------------------------------------------------------
// class seq0 extends seq_lib
// use `uvm_do and `uvm_do_with to excecute sequence
//------------------------------------------------------------------------------
//
// SEQUENCE: base yapp sequence - base sequence with objections from which 
// all sequences can be derived
//
//------------------------------------------------------------------------------
class base_seq extends uvm_sequence;

	`uvm_declare_p_sequencer(vseqr_c)

	// Required macro for sequences automation
	`uvm_object_utils(base_seq)


	// Constructor
	function new(string name="base_seq");
		super.new(name);
	endfunction

	task pre_body();
		uvm_phase phase;
		`ifdef UVM_VERSION_1_2
		// in UVM1.2, get starting phase from method
		phase = get_starting_phase();
		`else
		phase = starting_phase;
		`endif
		if (phase != null) begin
			phase.raise_objection(this, get_type_name());
			`uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
		end
	endtask : pre_body

	task post_body();
		uvm_phase phase;
		`ifdef UVM_VERSION_1_2
		// in UVM1.2, get starting phase from method
		phase = get_starting_phase();
		`else
		phase = starting_phase;
		`endif
		if (phase != null) begin
			phase.drop_objection(this, get_type_name());
			`uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
		end
	endtask : post_body

endclass : base_seq

class sequence_0 extends base_seq;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_object_utils_begin(sequence_0)
	`uvm_object_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "sequence_0");
		super.new(name);
	endfunction

	// Seqence body definition
	virtual task body();
		`uvm_info(get_full_name(), "[tientq]: start sequence ...", UVM_LOW);

	endtask

endclass

`endif

