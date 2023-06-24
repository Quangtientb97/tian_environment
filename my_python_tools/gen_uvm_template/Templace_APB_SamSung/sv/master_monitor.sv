class __SUB__master_monitor_c extends uvm_monitor;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// | Creat virtual interface, packet uvm_sequence_item
	__SUB__master_trans_c pkt;
	// virtual interface __INTF__ vintf;
	// uvm_analysis_port#(__ITEM__) item_collected_port;
   int num_pkt_col;
	bool has_check;
	bool has_cover;
	virtual interface __SUB__master_intf vintf;
	__SUB__config_c p_cfg;


	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(__SUB__master_monitor_c)
   `uvm_field_int(num_pkt_col, UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name="__SUB__master_monitor_c", uvm_component parent=null);
		super.new(name, parent);
		//__item__ = new("__item__", this);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase()", UVM_FULL);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(), "connect_phase()", UVM_FULL);

		if (!uvm_config_db#(virtual __SUB__master_intf)::get(this, get_full_name(), "vintf", vintf)) begin
			`uvm_fatal(get_full_name(), {"Virtual interface must be set for: ", get_full_name(), ".vintf"} )
		end
		if (!uvm_config_db#(__SUB__config_c)::get(null, get_full_name(), "p_cfg", p_cfg)) begin
			`uvm_fatal(get_full_name(), {"Configuaration class must be set for: ", get_full_name(), ".p_cfg"} )
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		// | Look for packets after reset
		//@(posedge vintf.reset)
		//@(negedge vintf.reset)
		//`uvm_info(get_type_name(), "Detected Reset Done", UVM_MEDIUM)
		//forever begin
		//	pkt = __SUB__master_trans_c::type_id::create("pkt", this);
		//	fork 
		//		//----------------
		//		// Monitor in here
		//		//----------------
		//	join
		//end
		// | TBD capture signal to pkt
		// | TBD

      //`uvm_info(get_type_name(), $sformatf("Packet Collected :\n%s", pkt.sprint()), UVM_LOW)
		// | write to port send to scoreboard
      //item_collected_port.write(pkt);
      num_pkt_col++;
	endtask

	// UVM_report_phase
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("Report: __ITEM__ Monitor Collected %0d Packets", num_pkt_col), UVM_LOW)
		// | TBD
		
	endfunction

endclass
