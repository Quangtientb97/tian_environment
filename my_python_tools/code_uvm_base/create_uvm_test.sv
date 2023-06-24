`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class my_server extends uvm_default_report_server;
	function string compose_report_message(
		uvm_report_message report_message,
		string report_object_name = ""
	);
		uvm_verbosity  verb    ;
		uvm_severity   sev     ;
		string 			id      ;
		string 			message ;
		string 			scope   ;
		
		$cast(verb , report_message.get_verbosity());
		$cast(sev  , report_message.get_severity());
		scope   = report_message.get_report_object().get_full_name();
		id      = report_message.get_id();
		message = report_message.get_message();

		return $psprintf("[%0t] %0s (%0s) %0s", $time, sev.name, id, message);
	endfunction
endclass

class class_name extends uvm_class_name;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	// Creat env (tb)
	uvm_factory m_factory; 

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_component_utils_begin(class_name)
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
		// handle env
		
		//uvm_config_wrapper::set(this, "<path>.__sequenceR__.run_phase",
		//	"default_sequence",
		//	__sequence__::get_type());

	endfunction

	// 	Connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

	endfunction

	// 	Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

	endtask

	// 	End_of_elaboration_phase
 	function void end_of_elaboration_phase(uvm_phase phase);
 		uvm_top.print_topology();
		m_factory = uvm_factory::get();
		m_factory.print();
 	endfunction

	function void start_of_simulation();
		my_server srv = new();
		uvm_report_server::set_server(srv);
		srv.print();
	endfunction

	function void check_phase(uvm_phase phase);
		check_config_usage();
	endfunction

endclass

`endif

