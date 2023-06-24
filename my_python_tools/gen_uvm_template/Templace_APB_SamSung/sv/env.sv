class __SUB__env_c extends uvm_env;
	int num_of_masters = 1;

	// num_of_slaves can more 1
	int num_of_slaves = 1;

	// The master agent
	__SUB__master_c master;

	// The slave agent
	__SUB__slave_c slave[];

	__SUB__config_c cfg;

	`uvm_component_utils_begin(__SUB__env_c)
	`uvm_field_object(cfg, UVM_ALL_ON)
	`uvm_field_int(num_of_slaves, UVM_ALL_ON | UVM_DEC)
	`uvm_field_int(num_of_masters, UVM_ALL_ON | UVM_DEC)
	`uvm_component_utils_end

	function new(string name="__SUB__env_c", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase()", UVM_FULL);

		// Contruct configuaration
		cfg = __SUB__config_c::type_id::create("cfg", this);
		cfg.num_of_segments = this.num_of_slaves;

		// Contruct master
		if (num_of_masters > 0) begin
			master = __SUB__master_c::type_id::create("master", this);
			master.master_slave = MASTER;
			master.name = M0;
			`uvm_info(get_full_name(), $psprintf("num_of_masters: %0d", num_of_masters), UVM_FULL)
		end

		// Contruct slave
		slave = new[num_of_slaves];
		foreach (slave[i]) begin
			slave[i] = __SUB__slave_c::type_id::create($psprintf("slave[%0d]", i), this);
			slave[i].master_slave = SLAVE;
			slave[i].name = slave_name_t'(i);
		end
		`uvm_info(get_full_name(), $psprintf("num_of_slaves: %0d", num_of_slaves), UVM_FULL)

		uvm_config_db#(__SUB__config_c)::set(this, "*", "p_cfg", cfg);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(), "connect_phase()", UVM_FULL);
	endfunction

	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
	endfunction

	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
	endfunction

endclass
