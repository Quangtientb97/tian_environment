class __SUB__slave_monitor_c extends uvm_monitor;
	string p_inst_name;
	string inst_name;
	bool has_check;
	bool has_cover;
	virtual interface __SUB__slave_intf vintf;
	__SUB__config_c p_cfg;


	`uvm_component_utils_begin(__SUB__slave_monitor_c)
	`uvm_component_utils_end

	function new(string name="__SUB__slave_monitor_c", uvm_component parent=null);
		super.new(name, parent);
		$sformat(inst_name, "%s SLAVE %s", p_inst_name, get_name());
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(inst_name, "build_phase()", UVM_FULL);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(inst_name, "connect_phase()", UVM_FULL);

		if (!uvm_config_db#(virtual __SUB__slave_intf)::get(this, get_full_name(), "vintf", vintf)) begin
			`uvm_fatal(inst_name, {"Virtual interface must be set for: ", get_full_name(), ".vintf"} )
		end
		if (!uvm_config_db#(__SUB__config_c)::get(null, get_full_name(), "p_cfg", p_cfg)) begin
			`uvm_fatal(inst_name, {"Configuaration class must be set for: ", get_full_name(), ".p_cfg"} )
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		`uvm_info(inst_name, "run_phase()", UVM_FULL);
		fork 
			begin
				super.run_phase(phase);
			end
			begin
				// monitor task
			end
			begin
				// monitor reset handles
			end
		join

	endtask

endclass
