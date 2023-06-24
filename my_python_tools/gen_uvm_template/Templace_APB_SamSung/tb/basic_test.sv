// Define report format 
class my_server extends uvm_default_report_server;
	function string compose_report_message(
		uvm_report_message report_message,
		string report_object_name = ""
	);
		uvm_verbosity verb;
		uvm_severity  sev ;
		string id          ;
		string message     ;
		string scope;

		$cast(verb , report_message.get_verbosity());
		$cast(sev  , report_message.get_severity());
		scope   = report_message.get_report_object().get_full_name();
		id      = report_message.get_id();
		message = report_message.get_message();

		return $psprintf("[%0t] %0s (%0s) %0s", $time, sev.name, id, message);
	endfunction
endclass

`ifndef BASIC_TEST_C
`define BASIC_TEST_C
class basic_test_c extends uvm_test;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------
	tb_c tb;
	uvm_factory m_factory; 

	`uvm_component_utils(basic_test_c)

	function new(string name = "basic_test_c", uvm_component parent = null);
		super.new(name, parent);

	endfunction

	virtual function void build_phase(uvm_phase phase);
		// uvm_config_db#(uvm_object_wrapper)::set*
		// set sequence to sequencer in order to start test
		uvm_config_int::set(this, "*", "recording_detail", 1);
		uvm_config_wrapper::set(this, "tb.vseqr.run_phase",
			"default_sequence",
			sequence_0::get_type());
		super.build_phase(phase);

		tb = tb_c::type_id::create("tb", this);

	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		uvm_top.print_topology();
	endtask

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
		`uvm_info(get_full_name(), "check_config_usage\n", UVM_LOW);
		check_config_usage();
	endfunction

endclass

`endif //BASIC_TEST_C
