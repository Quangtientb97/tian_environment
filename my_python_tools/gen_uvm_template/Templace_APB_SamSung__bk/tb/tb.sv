`ifndef TB_C
`define TB_C
class tb_c extends uvm_env;

	// Property
	// declare env
	__SUB__env_c __SUB__env;

	`uvm_component_utils(tb_c)

	function new (string name = "tb_c", uvm_component parent);
		super.new(name, parent);

	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// config object
		// uvm_config_db#()::set*
		// ----------
		// Create property env
		__SUB__env = __SUB__env_c::type_id::create("__SUB__env", this);

	endfunction
endclass
`endif //TB_C
