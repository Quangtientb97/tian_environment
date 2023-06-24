`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class class_name extends uvm_class_name;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// | Creat virtual interface, packet uvm_sequence_item
	// __ITEM__ pkt;
	// virtual interface __INTF__ vif;
	// uvm_analysis_port#(__ITEM__) item_collected_port;
   int num_pkt_col;

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(class_name)
   `uvm_field_int(num_pkt_col, UVM_ALL_ON)
	`uvm_component_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "class_name", uvm_component parent = null);
		super.new(name, parent);
		//__item__ = new("__item__", this);
	endfunction

	// 	Build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

	endfunction

	// 	Connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		// | Get virtual interface by uvm_config_db(virtual __intf__)::get*
		//if (!uvm_config_db#(virtual __INTF__)::get(this, get_full_name(),"vif", vif))
		//	`uvm_error("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})

	endfunction

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		// | Look for packets after reset
		//@(posedge vif.reset)
		//@(negedge vif.reset)
		//`uvm_info(get_type_name(), "Detected Reset Done", UVM_MEDIUM)
		//forever begin
		//	pkt = __ITEM__::type_id::create("pkt", this);
		//	fork 
		//		--------
		//		Monitor in here
		//	   --------
		//	join
		// | TBD capture signal to pkt
		// | TBD

      `uvm_info(get_type_name(), $sformatf("Packet Collected :\n%s", pkt.sprint()), UVM_LOW)
		// | write to port send to scoreboard
      //item_collected_port.write(pkt);
      num_pkt_col++;
	endtask

	// UVM_report_phase
	function void report_phase(uvm_phase phase;
		`uvm_info(get_type_name(), $sformatf("Report: __ITEM__ Monitor Collected %0d Packets", num_pkt_col), UVM_LOW)
		// | TBD
		
	endfunction

endclass

`endif

