class __SUB__master_driver_c extends uvm_driver#(__SUB__master_trans_c);
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// uvm_analysis_port 		rsp_port;
	// uvm_seq_item_pull_imp   seq_item_export;
	// Creat virtual interface
	// virtual interface __INTF__ vintf;
	virtual interface __SUB__master_intf vintf;
	__SUB__master_sequencer_c p_seqr;
	__SUB__config_c p_cfg;
	slave_name_t name;
	int num_sent;

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------

	`uvm_component_utils_begin(__SUB__master_driver_c)
	`uvm_field_int(num_sent, UVM_ALL_ON)
	`uvm_component_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name="__SUB__master_driver_c", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase()", UVM_FULL);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(), "connect_phase()", UVM_FULL);
		// Get virtual interface by uvm_config_db(virtual __intf__)::get*
      if (!uvm_config_db#(virtual __SUB__master_intf)::get(this,"","vintf", vintf))
        `uvm_error("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vintf"})
		
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(), "run_phase()", UVM_FULL);
		forever begin
			// Get new item from the sequencer
			seq_item_port.get_next_item(req);
			`uvm_info(get_type_name(), $sformatf("Sending Packet :\n%s", req.sprint()), UVM_HIGH)

			//--------------------------
			//TBD driver signal to dut
			//--------------------------

			// End transaction recording
			end_tr(req);
			num_sent++;
			// Communicate item done to the sequencer
			seq_item_port.item_done();
		end
	endtask

endclass
