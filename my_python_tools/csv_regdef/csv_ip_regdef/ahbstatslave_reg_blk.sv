//--------------------------------------------------------
// File Name   : ahbstatslave_reg_def.sv
// Description : ahbstatslave register definition
// Developers  : tian(tientq@coasia.com)
// Created	 :
// Generator   : csv_regdef
//--------------------------------------------------------


`ifndef SUV_ahbstatSlave_ahbFailedAddress_C
`define SUV_ahbstatSlave_ahbFailedAddress_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class ahbstatslave_ahbfailedaddress_c extends uvm_reg;
	rand uvm_reg_field haddr;
	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;

		haddr: coverpoint haddr.value[31:0]
		{
		`AUTO_COV_MIN_MAX(32)
		}

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(ahbstatslave_ahbfailedaddress_c)

	function new(string name = "unmapped-ahbfailedaddress");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.haddr = uvm_reg_field::type_id::create("haddr");
		this.haddr.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 1);

		if (has_coverage(UVM_CVR_FIELD_VALS))
			cg_vals.set_inst_name({get_full_name(), ".cg_vals"});

		if (has_coverage(CSV_CVR_REG_DIRECTION))
			cg_direction.set_inst_name({get_full_name(), ".cg_direction"});

	endfunction	// build

	protected virtual function void sample(uvm_reg_data_t data,
		uvm_reg_data_t byte_en,
		bit is_read,
		uvm_reg_map map);

		if (get_coverage(CSV_CVR_REG_DIRECTION)) begin
			if (!is_read) m_kind = UVM_WRITE;
			else m_kind = UVM_READ;
			cg_direction.sample();
		end //<<if

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end //<<if

	endfunction: sample

	virtual function void sample_values();
		super.sample_values();

		// TBD
	endfunction	// sample_values

	// Function and task for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	virtual function void set_sequence_base(uvm_sequence_base parent = null);
		`uvm_info(get_type_name(), "set_sequence_base() ...", UVM_FULL)
		seq_base = parent;
	endfunction	// set_sequence_base

	virtual task pre_write(uvm_reg_item rw);
		rw.parent = seq_base;
	endtask: pre_write

	virtual task pre_read(uvm_reg_item rw);
		rw.parent = seq_base;
	endtask: pre_read

endclass: ahbstatslave_ahbfailedaddress_c

`endif // SUV_ahbstatSlave_ahbFailedAddress_C


`ifndef SUV_ahbstatSlave_REG_BLK_C
`define SUV_ahbstatSlave_REG_BLK_C

class ahbstatslave_reg_blk_c extends uvm_reg_block;

	rand ahbstatslave_ahbstatus_c ahbstatus;
	rand ahbstatslave_ahbfailedaddress_c ahbfailedaddress;

	`uvm_object_utils(ahbstatslave_reg_blk_c)

	function new(string name = "ahbstatslave_reg_blk_c");
		super.new(name);
	endfunction	// new

	virtual function void build();

		default_map = create_map("default_map", `UVM_REG_DATA_WIDTH'h0, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN);

		this.ahbstatus = ahbstatslave_ahbstatus_c::type_id::create("ahbstatus");
		this.ahbstatus.configure(this, None);
		this.ahbstatus.build();

		default_map.add_reg(ahbstatus, 'h'h0);



		this.ahbfailedaddress = ahbstatslave_ahbfailedaddress_c::type_id::create("ahbfailedaddress");
		this.ahbfailedaddress.configure(this, None);
		this.ahbfailedaddress.build();

		default_map.add_reg(ahbfailedaddress, 'h'h4);



	endfunction	// build

	virtual function void set_sequence_base(uvm_sequence_base parent = null);
		ahbstatus.set_sequence_base(parent);
		ahbfailedaddress.set_sequence_base(parent);
	endfunction	// set_sequence_base

endclass: ahbstatslave_reg_blk_c

`endif // SUV_ahbstatSlave_REG_BLK_C
