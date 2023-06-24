// tranction of Master
class __SUB__master_trans_c extends uvm_sequence_item;
	// Property
	// rand bit [7:0] addr
	
	// Constraint
	// contraint addr_contraint {addr[1:0] == 0;}
	
	`uvm_object_utils_begin(__SUB__master_trans_c)
	// uvm_field_* to here
	`uvm_object_utils_end

	function new(string name="__SUB__master_trans_c");
		super.new(name);
	endfunction

endclass

// transaction of Slave
class __SUB__slave_trans_c extends uvm_sequence_item;
	// Property
	// rand bit [7:0] addr
	
	// Constraint
	// contraint addr_contraint {addr[1:0] == 0;}
	
	`uvm_object_utils_begin(__SUB__slave_trans_c)
	// uvm_field_* to here
	`uvm_object_utils_end

	function new(string name="__SUB__slave_trans_c");
		super.new(name);
	endfunction

endclass
