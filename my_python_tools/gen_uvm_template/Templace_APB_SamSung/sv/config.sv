class __SUB__config_c extends uvm_component;
	// declare more to here
	int num_of_segments = 2;
	
	`uvm_component_utils_begin(__SUB__config_c)
		//`uvm_field_*
	`uvm_field_int(num_of_segments, UVM_ALL_ON | UVM_DEC)
	`uvm_component_utils_end

	function new(string name="__SUB__config_c", uvm_component parent);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		// to keep topology between uvm_config_db from higher object and generation 
		// uvm_config_db#()::*
		// TBD
		super.build_phase(phase);

	endfunction

	function void start_of_simulation_phase(uvm_phase phase);
		// print object to here

	endfunction
endclass
