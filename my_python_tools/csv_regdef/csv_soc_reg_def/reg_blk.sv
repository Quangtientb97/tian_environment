// --------------------------------------------
// File Name   : reg_blk.sv
// Description :
// Developers  :
// Created     :
// Generator   : csv_regdef
// --------------------------------------------

`ifndef SEC_REG_COVERAGE_MODEL_E
`define SEC_REG_COVERAGE_MODEL_E
typedef enum {
	SEC_CVR_REG_DIRECTION = 'h0010
} sec_reg_coverage_model_e;
`endif //SEC_REG_COVERAGE_MODEL_E

`ifndef SUV_REG_BLK_C
`define SUV_REG_BLK_C

// -----------------------------------------------------------
// Register block definition for Top-level verification env
// -----------------------------------------------------------

class reg_blk_c extends uvm_reg_block;

	`ifndef SUV_REG_BLK_0_FAKE
	rand ahbstatSlave_reg_blk_c reg_blk_0;
	`endif // SUV_REG_BLK_0_FAKE

	`ifndef SUV_REG_BLK_1_FAKE
	rand ahbstatSlave_reg_blk_c reg_blk_1;
	`endif // SUV_REG_BLK_1_FAKE

	`ifndef SUV_REG_BLK_2_FAKE
	rand ahbstatSlave_reg_blk_c reg_blk_2;
	`endif // SUV_REG_BLK_2_FAKE

	`ifndef SUV_REG_BLK_3_FAKE
	rand ahbstatSlave_reg_blk_c reg_blk_3;
	`endif // SUV_REG_BLK_3_FAKE

	`ifndef SUV_REG_BLK_4_FAKE
	rand ahbstatSlave_reg_blk_c reg_blk_4;
	`endif // SUV_REG_BLK_4_FAKE


	uvm_reg_map axi_map;

	`uvm_object_utils_begin(reg_blk_c)
	`uvm_object_utils_end

	function new(string name = "reg_blk_c");

		super.new(name, .has_coverage(UVM_NO_COVERAGE));
		`uvm_info(get_full_name(), "new() ...", UVM_FULL)

	endfunction	// new

	//--------------------------------------------------------
	//  Construct register file and register base address to address map 
	//--------------------------------------------------------
	virtual function void build();
		`uvm_info(get_full_name(), "build() ...", UVM_FULL)

		axi_map = create_map("axi_map", `SEC_REG_BOOT_BASE_ADDR, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN, 0);

		default_map = axi_map;

		`ifndef SUV_REG_BLK_0_FAKE
		reg_blk_0 = ahbstatSlave_reg_blk_c::type_id::create("reg_blk_0");
		reg_blk_0.configure(this);
		reg_blk_0.build();
		axi_map.add_submap(this.reg_blk_0.default_map, `SEC_REG_REG_BLK_0_BASE_ADDR);
		`endif // SUV_REG_BLK_0_FAKE

		`ifndef SUV_REG_BLK_1_FAKE
		reg_blk_1 = ahbstatSlave_reg_blk_c::type_id::create("reg_blk_1");
		reg_blk_1.configure(this);
		reg_blk_1.build();
		axi_map.add_submap(this.reg_blk_1.default_map, `SEC_REG_REG_BLK_1_BASE_ADDR);
		`endif // SUV_REG_BLK_1_FAKE

		`ifndef SUV_REG_BLK_2_FAKE
		reg_blk_2 = ahbstatSlave_reg_blk_c::type_id::create("reg_blk_2");
		reg_blk_2.configure(this);
		reg_blk_2.build();
		axi_map.add_submap(this.reg_blk_2.default_map, `SEC_REG_REG_BLK_2_BASE_ADDR);
		`endif // SUV_REG_BLK_2_FAKE

		`ifndef SUV_REG_BLK_3_FAKE
		reg_blk_3 = ahbstatSlave_reg_blk_c::type_id::create("reg_blk_3");
		reg_blk_3.configure(this);
		reg_blk_3.build();
		axi_map.add_submap(this.reg_blk_3.default_map, `SEC_REG_REG_BLK_3_BASE_ADDR);
		`endif // SUV_REG_BLK_3_FAKE

		`ifndef SUV_REG_BLK_4_FAKE
		reg_blk_4 = ahbstatSlave_reg_blk_c::type_id::create("reg_blk_4");
		reg_blk_4.configure(this);
		reg_blk_4.build();
		axi_map.add_submap(this.reg_blk_4.default_map, `SEC_REG_REG_BLK_4_BASE_ADDR);
		`endif // SUV_REG_BLK_4_FAKE


		lock_model();

	endfunction	// build

	// Fuction and tasks for blocking operation
	// This function is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	
	virtual function void axi_set_sequence_base(uvm_sequence_base parent = null);
		`uvm_info(get_full_name(), "axi_set_sequence_base() ...", UVM_FULL)
		`ifndef SUV_REG_BLK_0_FAKE
		reg_blk_0.set_sequence_base(parent);
		`endif // SUV_REG_BLK_0_FAKE

		`ifndef SUV_REG_BLK_1_FAKE
		reg_blk_1.set_sequence_base(parent);
		`endif // SUV_REG_BLK_1_FAKE

		`ifndef SUV_REG_BLK_2_FAKE
		reg_blk_2.set_sequence_base(parent);
		`endif // SUV_REG_BLK_2_FAKE

		`ifndef SUV_REG_BLK_3_FAKE
		reg_blk_3.set_sequence_base(parent);
		`endif // SUV_REG_BLK_3_FAKE

		`ifndef SUV_REG_BLK_4_FAKE
		reg_blk_4.set_sequence_base(parent);
		`endif // SUV_REG_BLK_4_FAKE


	endfunction	// axi_set_sequence_base
	
endclass: reg_blk_c

`endif //SUV_REG_BLK_C
