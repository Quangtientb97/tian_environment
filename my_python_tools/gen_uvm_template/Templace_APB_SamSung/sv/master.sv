class __SUB__master_c extends __SUB__agent_c;
	master_name_t name;
	__SUB__master_driver_c 		driver;
	__SUB__master_sequencer_c 	sequencer;
	__SUB__master_monitor_c 	monitor;

	`uvm_component_utils_begin(__SUB__master_c)
	`uvm_component_utils_end

	function new(string name="__SUB__master_c", uvm_component parent=null);
		super.new(name, parent);
		 
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase()", UVM_FULL);

		// Contruc master monitor
		monitor = __SUB__master_monitor_c::type_id::create("monitor", this);
		monitor.has_check = has_check;
		monitor.has_cover = has_cover;

		if (active_passive == UVM_ACTIVE) begin
			// Contruct master sequencer
			sequencer = __SUB__master_sequencer_c::type_id::create("sequencer", this);

			// Contruct master driver
			driver = __SUB__master_driver_c::type_id::create("driver", this);
			driver.p_seqr = this.sequencer;
		end
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(), "connect_phase()", UVM_FULL);

		// Connect analysis port between driver and sequencer
		if (active_passive == UVM_ACTIVE) begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end
	endfunction
endclass
