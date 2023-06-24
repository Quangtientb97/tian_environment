//--------------------------------------------------------
// File Name   : ahbstatSlave_reg_def.sv
// Description : ahbstatSlave register definition
// Developers  : tian(tientq@coasia.com)
// Created	 :
// Generator   : csv_regdef
//--------------------------------------------------------


`ifndef SUV_AHBSTATSLAVE_AHBSTATUS_C
`define SUV_AHBSTATSLAVE_AHBSTATUS_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class ahbstatSlave_ahbStatus_c extends uvm_reg;
	rand uvm_reg_field hsize;
	rand uvm_reg_field hmaster;
	rand uvm_reg_field rw;
	rand uvm_reg_field newerror;
	rand uvm_reg_field reserved;
	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;

		hsize: coverpoint hsize.value[2:0]
		{
		`AUTO_COV_MIN_MAX(3)
		}

		hmaster: coverpoint hmaster.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		}

		rw: coverpoint rw.value[0:0];
		newerror: coverpoint newerror.value[0:0];
	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(ahbstatSlave_ahbStatus_c)

	function new(string name = "unmapped-ahbStatus");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.hsize = uvm_reg_field::type_id::create("hsize");
		this.hmaster = uvm_reg_field::type_id::create("hmaster");
		this.rw = uvm_reg_field::type_id::create("rw");
		this.newerror = uvm_reg_field::type_id::create("newerror");
		this.reserved = uvm_reg_field::type_id::create("reserved");
		this.hsize.configure(this, 3, 0, "RW", 0, 'h0, 1, 1, 1);
		this.hmaster.configure(this, 4, 3, "RW", 0, 'h0, 1, 1, 1);
		this.rw.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 1);
		this.newerror.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 1);
		this.reserved.configure(this, 23, 9, "RO", 0, 'h0, 1, 1, 1);

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

endclass: ahbstatSlave_ahbStatus_c

`endif // SUV_AHBSTATSLAVE_AHBSTATUS_C


`ifndef SUV_AHBSTATSLAVE_AHBFAILEDADDRESS_C
`define SUV_AHBSTATSLAVE_AHBFAILEDADDRESS_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class ahbstatSlave_ahbFailedAddress_c extends uvm_reg;
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

	`uvm_object_utils(ahbstatSlave_ahbFailedAddress_c)

	function new(string name = "unmapped-ahbFailedAddress");
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

endclass: ahbstatSlave_ahbFailedAddress_c

`endif // SUV_AHBSTATSLAVE_AHBFAILEDADDRESS_C


`ifndef SUV_AHBSTATSLAVE_REG_BLK_C
`define SUV_AHBSTATSLAVE_REG_BLK_C

class ahbstatSlave_reg_blk_c extends uvm_reg_block;

	rand ahbstatSlave_ahbstatus_c ahbstatus;
	rand ahbstatSlave_ahbfailedaddress_c ahbfailedaddress;

	`uvm_object_utils(ahbstatSlave_reg_blk_c)

	function new(string name = "ahbstatSlave_reg_blk_c");
		super.new(name);
	endfunction	// new

	virtual function void build();

		default_map = create_map("default_map", `UVM_REG_DATA_WIDTH'h0, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN);

		this.ahbstatus = ahbstatSlave_ahbstatus_c::type_id::create("ahbstatus");
		this.ahbstatus.configure(this, Null);
		this.ahbstatus.build();

		default_map.add_reg(ahbstatus, 'h0);



		this.ahbfailedaddress = ahbstatSlave_ahbfailedaddress_c::type_id::create("ahbfailedaddress");
		this.ahbfailedaddress.configure(this, Null);
		this.ahbfailedaddress.build();

		default_map.add_reg(ahbfailedaddress, 'h4);



	endfunction	// build

	virtual function void set_sequence_base(uvm_sequence_base parent = null);
		ahbstatus.set_sequence_base(parent);
		ahbfailedaddress.set_sequence_base(parent);
	endfunction	// set_sequence_base

endclass: ahbstatSlave_reg_blk_c

`endif // SUV_AHBSTATSLAVE_REG_BLK_C
