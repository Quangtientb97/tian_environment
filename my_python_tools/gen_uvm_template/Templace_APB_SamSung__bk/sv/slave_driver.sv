class __SUB__slave_driver_c extends uvm_driver#(__SUB__slave_trans_c);
	string p_inst_name;
	string inst_name;
	slave_name_t name;
	virtual interface __SUB__slave_intf vintf;
	__SUB__slave_sequencer_c p_seqr;
	__SUB__config_c p_cfg;

	`uvm_component_utils_begin(__SUB__slave_driver_c)
	`uvm_component_utils_end

	function new(string name="__SUB__slave_driver_c", uvm_component parent=null);
		super.new(name, parent);
		inst_name = get_name();
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(inst_name, "build_phase()", UVM_FULL);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(inst_name, "connect_phase()", UVM_FULL);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(inst_name, "run_phase()", UVM_FULL);
	endtask

endclass
