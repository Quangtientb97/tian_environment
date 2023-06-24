

`ifndef SUV___NAME_BLK___REG_BLK_C
`define SUV___NAME_BLK___REG_BLK_C

class __NAME_BLK___reg_blk_c extends uvm_reg_block;

	__REG_BLK_C_PROPERTY__

	`uvm_object_utils(__NAME_BLK___reg_blk_c)

	function new(string name = "__NAME_BLK___reg_blk_c");
		super.new(name);
	endfunction	// new

	virtual function void build();

		default_map = create_map("default_map", `UVM_REG_DATA_WIDTH'h0, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN);

		__BUILD_REGISTER__
	endfunction	// build

	virtual function void set_sequence_base(uvm_sequence_base parent = null);
		__SET_SEQ_BASE__
	endfunction	// set_sequence_base

endclass: __NAME_BLK___reg_blk_c

`endif // SUV___NAME_BLK___REG_BLK_C
