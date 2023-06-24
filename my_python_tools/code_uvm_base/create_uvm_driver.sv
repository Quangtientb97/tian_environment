`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class class_name extends uvm_class_name#(__PAREMETER_TYPE__);
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	int num_sent;
	// uvm_analysis_port 		rsp_port;
	// uvm_seq_item_pull_imp   seq_item_export;
	// Creat virtual interface
	// virtual interface __INTF__ vif;

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(class_name)
   `uvm_field_int(num_sent, UVM_ALL_ON)
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
		// Get virtual interface by uvm_config_db(virtual __intf__)::get*
      //if (!uvm_config_db#(virtual __INTF__)::get(this,"","vif", vif))
      //  `uvm_error("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})

	endfunction

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
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

  // UVM report_phase
  function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("Report: __UVC_NAME__ driver sent %0d packets", num_sent), UVM_LOW)
  endfunction : report_phase

endclass

`endif

