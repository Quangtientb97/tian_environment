class __SUB__slave_c extends __SUB__agent_c;
	slave_name_t 			name;
	__SUB__slave_driver_c 		driver;
	__SUB__slave_sequencer_c 	sequencer;
	__SUB__slave_monitor_c 		monitor;

	`uvm_component_utils_begin(__SUB__slave_c)
	`uvm_component_utils_end

	function new(string name="__SUB__slave_c", uvm_component parent=null);
		super.new(name, parent);
		 
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$sformat(inst_name, "%s SLAVE", p_env_name);
		`uvm_info(inst_name, "build_phase()", UVM_FULL);

		// Contruc slave monitor
		monitor = __SUB__slave_monitor_c::type_id::create("monitor", this);
		monitor.p_inst_name = this.inst_name;
		monitor.has_check = this.has_check;
		monitor.has_cover = this.has_cover;

		if (active_passive == UVM_ACTIVE) begin
			// Contruct slave sequencer
			sequencer = __SUB__slave_sequencer_c::type_id::create("sequencer", this);
			sequencer.p_inst_name = this.inst_name;

			// Contruct slave driver
			driver = __SUB__slave_driver_c::type_id::create("driver", this);
			driver.p_inst_name = this.inst_name;
			driver.p_seqr = this.sequencer;
			driver.name = this.name;
		end
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(inst_name, "connect_phase()", UVM_FULL);

		// Connect analysis port between driver and sequencer
		if (active_passive == UVM_ACTIVE) begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end
	endfunction

endclass
