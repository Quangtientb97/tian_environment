`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class class_name extends uvm_class_name;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(class_name)
	`uvm_component_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "class_name", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	// 	Build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

	endfunction

	// 	Connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

	endfunction

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

	endtask

endclass

`endif

