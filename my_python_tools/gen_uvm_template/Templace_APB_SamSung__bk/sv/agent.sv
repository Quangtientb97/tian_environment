class __SUB__agent_c extends uvm_agent;
	// the variable for env name
	string p_env_name;
	// the variable for hierarchical name
	string inst_name;
	// The configration class
	__SUB__config_c p_cfg;

	// Set whether it is active or passive agent
	// for configuration, use uvm_config_db::set()
	uvm_active_passive_enum active_passive;

	// the kind of agent (MASTER/SLAVE)
	// for configuration, use uvm_config_db::set()
	agent_kind_t 				master_slave;

	// set whether it has checker or not
	bool has_check = FALSE;

	// set whether it do collecting coverage or not
	bool has_cover = FALSE;

	`uvm_component_utils_begin(__SUB__agent_c)
		`uvm_field_enum(uvm_active_passive_enum , active_passive , UVM_ALL_ON)
		`uvm_field_enum(agent_kind_t            , master_slave   , UVM_ALL_ON)
		`uvm_field_enum(bool                    , has_check      , UVM_ALL_ON)
		`uvm_field_enum(bool                    , has_cover      , UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name = "__SUB__agent_c", uvm_component parent = null);
		super.new(name, parent);

	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(inst_name, "connect_phase()", UVM_FULL)
		if (!uvm_config_db#(__SUB__config_c)::get(null, get_full_name(), "p_cfg", p_cfg)) begin
			`uvm_fatal(inst_name, {"Configuaration class must be set for", get_full_name(), ".p_cfg"})
		end

	endfunction

endclass
