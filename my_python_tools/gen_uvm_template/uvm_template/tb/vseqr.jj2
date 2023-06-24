`ifndef __VSEQR_C__
`define __VSEQR_C__

class vseqr_c extends uvm_sequencer;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// Instance sub sequencer

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(vseqr_c)
	`uvm_component_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "vseqr_c", uvm_component parent);
		super.new(name, parent);
	endfunction

	// 	Build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// Handle sub sequencer

	endfunction

	// 	Connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

	endfunction

	// start_of_simulation
	function void start_of_simulation_phase(uvm_phase phase);
		`uvm_info(get_type_name(), {"start of simulation for ", get_full_name()}, UVM_HIGH)
	endfunction : start_of_simulation_phase

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

	endtask

endclass

`endif

