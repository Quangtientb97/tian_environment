class __SUB__slave_sequencer_c extends uvm_sequencer #(__SUB__slave_trans_c);
	virtual interface __SUB__slave_intf vintf;

	string p_inst_name;
	string inst_name;

	`uvm_component_utils_begin(__SUB__slave_sequencer_c)
	`uvm_component_utils_end

	function new(string name="__SUB__slave_sequencer_c", uvm_component parent);
		super.new(name, parent);

	endfunction

	virtual function void build_phase(uvm_phase phase);
		$sformat(inst_name, "%s SEQR", p_inst_name);
		`uvm_info(inst_name, "build_phase()", UVM_FULL)
		super.build_phase(phase);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(inst_name, "connect_phase()", UVM_FULL)

		if (!uvm_config_db#(virtual __SUB__slave_intf)::get(this, get_full_name(), "vintf", vintf))
			`uvm_fatal(inst_name, {"Virtual interface must be set for: ", get_full_name(), ".vintf"})
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

	endtask
endclass
