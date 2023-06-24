
//--------------------------------------------------------
// File Name   : yapp_reg_def.sv
// Description : yapp register definition
// Developers  : tian(tientq@coasia.com)
// Created	   :
// Generator   : csv_regdef_from_exel
//--------------------------------------------------------

`ifndef SUV_YAPP_CTRL_REG_C
`define SUV_YAPP_CTRL_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_ctrl_reg_c extends uvm_reg;
	rand uvm_reg_field maxpktsize; // Maximum paxket length
	rand uvm_reg_field reserved; // Unused 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		maxpktsize: coverpoint maxpktsize[5:0]
		{
		`AUTO_COV_MIN_MAX(6)
		}
		reserved: coverpoint reserved[1:0]
		{
		`AUTO_COV_MIN_MAX(2)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_ctrl_reg_c)

	function new(string name = "unmapped-ctrl_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.maxpktsize    = uvm_reg_field::type_id::create("maxpktsize");
		this.reserved    = uvm_reg_field::type_id::create("reserved");
		this.maxpktsize.configure(this, 6, 0, "RW", 0, 'h3f, 1, 1, 1);
		this.reserved.configure(this, 2, 6, "RW", 0, 'h3, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_ctrl_reg_c

`endif // SUV_YAPP_CTRL_REG_C

`ifndef SUV_YAPP_PARITY_ERR_CNT_REG_C
`define SUV_YAPP_PARITY_ERR_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_parity_err_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field parity_err_cnt_reg; // Packet parity error count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		parity_err_cnt_reg: coverpoint parity_err_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_parity_err_cnt_reg_c)

	function new(string name = "unmapped-parity_err_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.parity_err_cnt_reg    = uvm_reg_field::type_id::create("parity_err_cnt_reg");
		this.parity_err_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_parity_err_cnt_reg_c

`endif // SUV_YAPP_PARITY_ERR_CNT_REG_C

`ifndef SUV_YAPP_OVERRSIZED_PKT_CNT_REG_C
`define SUV_YAPP_OVERRSIZED_PKT_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_overrsized_pkt_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field overrsized_pkt_cnt_reg; // Oversied packet count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		overrsized_pkt_cnt_reg: coverpoint overrsized_pkt_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_overrsized_pkt_cnt_reg_c)

	function new(string name = "unmapped-overrsized_pkt_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.overrsized_pkt_cnt_reg    = uvm_reg_field::type_id::create("overrsized_pkt_cnt_reg");
		this.overrsized_pkt_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_overrsized_pkt_cnt_reg_c

`endif // SUV_YAPP_OVERRSIZED_PKT_CNT_REG_C

`ifndef SUV_YAPP_ADDR3_CNT_REG_C
`define SUV_YAPP_ADDR3_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_addr3_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field addr3_cnt_reg; // illegal addres packet count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		addr3_cnt_reg: coverpoint addr3_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_addr3_cnt_reg_c)

	function new(string name = "unmapped-addr3_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.addr3_cnt_reg    = uvm_reg_field::type_id::create("addr3_cnt_reg");
		this.addr3_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_addr3_cnt_reg_c

`endif // SUV_YAPP_ADDR3_CNT_REG_C

`ifndef SUV_YAPP_ADDR0_CNT_REG_C
`define SUV_YAPP_ADDR0_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_addr0_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field addr0_cnt_reg; // Address 0 packet count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		addr0_cnt_reg: coverpoint addr0_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_addr0_cnt_reg_c)

	function new(string name = "unmapped-addr0_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.addr0_cnt_reg    = uvm_reg_field::type_id::create("addr0_cnt_reg");
		this.addr0_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_addr0_cnt_reg_c

`endif // SUV_YAPP_ADDR0_CNT_REG_C

`ifndef SUV_YAPP_ADDR1_CNT_REG_C
`define SUV_YAPP_ADDR1_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_addr1_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field addr1_cnt_reg; // Address 1 packet count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		addr1_cnt_reg: coverpoint addr1_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_addr1_cnt_reg_c)

	function new(string name = "unmapped-addr1_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.addr1_cnt_reg    = uvm_reg_field::type_id::create("addr1_cnt_reg");
		this.addr1_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_addr1_cnt_reg_c

`endif // SUV_YAPP_ADDR1_CNT_REG_C

`ifndef SUV_YAPP_ADDR2_CNT_REG_C
`define SUV_YAPP_ADDR2_CNT_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_addr2_cnt_reg_c extends uvm_reg;
	rand uvm_reg_field addr2_cnt_reg; // Address 2 packet count 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		addr2_cnt_reg: coverpoint addr2_cnt_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_addr2_cnt_reg_c)

	function new(string name = "unmapped-addr2_cnt_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.addr2_cnt_reg    = uvm_reg_field::type_id::create("addr2_cnt_reg");
		this.addr2_cnt_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_addr2_cnt_reg_c

`endif // SUV_YAPP_ADDR2_CNT_REG_C

`ifndef SUV_YAPP_MEM_SIZE_REG_C
`define SUV_YAPP_MEM_SIZE_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_mem_size_reg_c extends uvm_reg;
	rand uvm_reg_field mem_size_reg; // Length of last packet received 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		mem_size_reg: coverpoint mem_size_reg[7:0]
		{
		`AUTO_COV_MIN_MAX(8)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_mem_size_reg_c)

	function new(string name = "unmapped-mem_size_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.mem_size_reg    = uvm_reg_field::type_id::create("mem_size_reg");
		this.mem_size_reg.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_mem_size_reg_c

`endif // SUV_YAPP_MEM_SIZE_REG_C

`ifndef SUV_YAPP_EN_REG_C
`define SUV_YAPP_EN_REG_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class yapp_en_reg_c extends uvm_reg;
	rand uvm_reg_field router_en; // Router enable
	rand uvm_reg_field parity_err_cnt_en; // parity error count enable
	rand uvm_reg_field oversized_pkt_cnt_en; // oversized pktor count enable
	rand uvm_reg_field reserved; // Not implemented
	rand uvm_reg_field addr0_cnt_en; // addr0 cnt or count enable
	rand uvm_reg_field addr0_cnt_en; // addr1 cnt or count enable
	rand uvm_reg_field addr0_cnt_en; // addr2 cnt or count enable
	rand uvm_reg_field addr0_cnt_en; // illegal address 3 packet count enable 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		router_en: coverpoint router_en[0:0]
		parity_err_cnt_en: coverpoint parity_err_cnt_en[0:0]
		oversized_pkt_cnt_en: coverpoint oversized_pkt_cnt_en[0:0]
		reserved: coverpoint reserved[0:0]
		addr0_cnt_en: coverpoint addr0_cnt_en[0:0]
		addr0_cnt_en: coverpoint addr0_cnt_en[0:0]
		addr0_cnt_en: coverpoint addr0_cnt_en[0:0]
		addr0_cnt_en: coverpoint addr0_cnt_en[0:0] 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(yapp_en_reg_c)

	function new(string name = "unmapped-en_reg");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.router_en    = uvm_reg_field::type_id::create("router_en");
		this.parity_err_cnt_en    = uvm_reg_field::type_id::create("parity_err_cnt_en");
		this.oversized_pkt_cnt_en    = uvm_reg_field::type_id::create("oversized_pkt_cnt_en");
		this.reserved    = uvm_reg_field::type_id::create("reserved");
		this.addr0_cnt_en    = uvm_reg_field::type_id::create("addr0_cnt_en");
		this.addr0_cnt_en    = uvm_reg_field::type_id::create("addr0_cnt_en");
		this.addr0_cnt_en    = uvm_reg_field::type_id::create("addr0_cnt_en");
		this.addr0_cnt_en    = uvm_reg_field::type_id::create("addr0_cnt_en");
		this.router_en.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 1);
		this.parity_err_cnt_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 1);
		this.oversized_pkt_cnt_en.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 1);
		this.reserved.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 1);
		this.addr0_cnt_en.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 1);
		this.addr0_cnt_en.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 1);
		this.addr0_cnt_en.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 1);
		this.addr0_cnt_en.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 1); 

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
		end 

		if (get_coverage(UVM_CVR_FIELD_VALS)) begin
			cg_vals.sample();
		end 

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

endclass: yapp_en_reg_c

`endif // SUV_YAPP_EN_REG_C
`ifndef SUV_YAPP_REG_BLK_C
`define SUV_YAPP_REG_BLK_C

class yapp_reg_blk_c extends uvm_reg_block; 
	rand yapp_ctrl_reg_c ctrl_reg; 
	rand yapp_parity_err_cnt_reg_c parity_err_cnt_reg; 
	rand yapp_overrsized_pkt_cnt_reg_c overrsized_pkt_cnt_reg; 
	rand yapp_addr3_cnt_reg_c addr3_cnt_reg; 
	rand yapp_addr0_cnt_reg_c addr0_cnt_reg; 
	rand yapp_addr1_cnt_reg_c addr1_cnt_reg; 
	rand yapp_addr2_cnt_reg_c addr2_cnt_reg; 
	rand yapp_mem_size_reg_c mem_size_reg; 
	rand yapp_en_reg_c en_reg; 

	`uvm_object_utils(yapp_reg_blk_c)

	function new(string name = "yapp_reg_blk_c");
		super.new(name);
	endfunction	// new

	virtual function void build();

		default_map = create_map("default_map", `UVM_REG_DATA_WIDTH'h0, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN);
	 
		this.ctrl_reg = yapp_ctrl_reg_c::type_id::create("ctrl_reg");
		this.ctrl_reg.configure(this, null);
		this.ctrl_reg.build();
		default_map.add_reg(ctrl_reg, 'h0x1000);
	 
		this.parity_err_cnt_reg = yapp_parity_err_cnt_reg_c::type_id::create("parity_err_cnt_reg");
		this.parity_err_cnt_reg.configure(this, null);
		this.parity_err_cnt_reg.build();
		default_map.add_reg(parity_err_cnt_reg, 'h0x1004);
	 
		this.overrsized_pkt_cnt_reg = yapp_overrsized_pkt_cnt_reg_c::type_id::create("overrsized_pkt_cnt_reg");
		this.overrsized_pkt_cnt_reg.configure(this, null);
		this.overrsized_pkt_cnt_reg.build();
		default_map.add_reg(overrsized_pkt_cnt_reg, 'h0x1005);
	 
		this.addr3_cnt_reg = yapp_addr3_cnt_reg_c::type_id::create("addr3_cnt_reg");
		this.addr3_cnt_reg.configure(this, null);
		this.addr3_cnt_reg.build();
		default_map.add_reg(addr3_cnt_reg, 'h0x1006);
	 
		this.addr0_cnt_reg = yapp_addr0_cnt_reg_c::type_id::create("addr0_cnt_reg");
		this.addr0_cnt_reg.configure(this, null);
		this.addr0_cnt_reg.build();
		default_map.add_reg(addr0_cnt_reg, 'h0x1009);
	 
		this.addr1_cnt_reg = yapp_addr1_cnt_reg_c::type_id::create("addr1_cnt_reg");
		this.addr1_cnt_reg.configure(this, null);
		this.addr1_cnt_reg.build();
		default_map.add_reg(addr1_cnt_reg, 'h0x100a);
	 
		this.addr2_cnt_reg = yapp_addr2_cnt_reg_c::type_id::create("addr2_cnt_reg");
		this.addr2_cnt_reg.configure(this, null);
		this.addr2_cnt_reg.build();
		default_map.add_reg(addr2_cnt_reg, 'h0x100b);
	 
		this.mem_size_reg = yapp_mem_size_reg_c::type_id::create("mem_size_reg");
		this.mem_size_reg.configure(this, null);
		this.mem_size_reg.build();
		default_map.add_reg(mem_size_reg, 'h0x100d);
	 
		this.en_reg = yapp_en_reg_c::type_id::create("en_reg");
		this.en_reg.configure(this, null);
		this.en_reg.build();
		default_map.add_reg(en_reg, 'h0x1001);
	 

	endfunction	// build

	virtual function void set_sequence_base(uvm_sequence_base parent = null); 
		ctrl_reg.set_sequence_base(parent); 
		parity_err_cnt_reg.set_sequence_base(parent); 
		overrsized_pkt_cnt_reg.set_sequence_base(parent); 
		addr3_cnt_reg.set_sequence_base(parent); 
		addr0_cnt_reg.set_sequence_base(parent); 
		addr1_cnt_reg.set_sequence_base(parent); 
		addr2_cnt_reg.set_sequence_base(parent); 
		mem_size_reg.set_sequence_base(parent); 
		en_reg.set_sequence_base(parent); 
	endfunction	// set_sequence_base

endclass: yapp_reg_blk_c

`endif // SUV_YAPP_REG_BLK_C