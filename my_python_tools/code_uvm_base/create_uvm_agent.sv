`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class class_name extends uvm_class_name;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// uvm_active_passive_enum is_active = UVM_ACTIVE;
	// Creat driver, monitor, sequencer

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(class_name)
	//`uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
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
		// handle driver, monitor, sequencer

	endfunction

	// 	Connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//connect | driver.seq_item_port.connect(sequencer.seq_item_export);

	endfunction

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

	endtask

endclass

`endif

