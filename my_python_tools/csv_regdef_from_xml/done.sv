
//--------------------------------------------------------
// File Name   : apb_reg_def.sv
// Description : apb register definition
// Developers  : tian(tientq@coasia.com)
// Created	   :
// Generator   : csv_regdef_from_exel
//--------------------------------------------------------

`ifndef SUV_APB_CTRL_C
`define SUV_APB_CTRL_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_CTRL_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_4; // Reserved
	rand uvm_reg_field TimerIntEn; // Timer interrupt enable bit
	rand uvm_reg_field SelectExtClk; // Select external input as clock. The external input can be used as a clock
	rand uvm_reg_field SelectExtEn; // Select external input as enable. The zero to one transition of the external input can be used as a timer enable
	rand uvm_reg_field Enable; // Enable bit. 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_4: coverpoint Reserved_31_4.value[27:0]
		{
		`AUTO_COV_MIN_MAX(28)
		}
		TimerIntEn: coverpoint TimerIntEn.value[0:0];
		SelectExtClk: coverpoint SelectExtClk.value[0:0];
		SelectExtEn: coverpoint SelectExtEn.value[0:0];
		Enable: coverpoint Enable.value[0:0]; 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_CTRL_c)

	function new(string name = "unmapped-CTRL");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_4    = uvm_reg_field::type_id::create("Reserved_31_4");
		this.TimerIntEn    = uvm_reg_field::type_id::create("TimerIntEn");
		this.SelectExtClk    = uvm_reg_field::type_id::create("SelectExtClk");
		this.SelectExtEn    = uvm_reg_field::type_id::create("SelectExtEn");
		this.Enable    = uvm_reg_field::type_id::create("Enable");
		this.Reserved_31_4.configure(this, 28, 4, "RO", 0, 'h0, 1, 1, 1);
		this.TimerIntEn.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 1);
		this.SelectExtClk.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 1);
		this.SelectExtEn.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 1);
		this.Enable.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 1); 

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

endclass: apb_CTRL_c

`endif // SUV_APB_CTRL_C

`ifndef SUV_APB_VALUE_C
`define SUV_APB_VALUE_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_VALUE_c extends uvm_reg;
	rand uvm_reg_field VALUE; // Current value 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		VALUE: coverpoint VALUE.value[31:0]
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

	`uvm_object_utils(apb_VALUE_c)

	function new(string name = "unmapped-VALUE");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.VALUE    = uvm_reg_field::type_id::create("VALUE");
		this.VALUE.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 1); 

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

endclass: apb_VALUE_c

`endif // SUV_APB_VALUE_C

`ifndef SUV_APB_RELOAD_C
`define SUV_APB_RELOAD_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_RELOAD_c extends uvm_reg;
	rand uvm_reg_field RELOAD; // Reload value 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		RELOAD: coverpoint RELOAD.value[31:0]
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

	`uvm_object_utils(apb_RELOAD_c)

	function new(string name = "unmapped-RELOAD");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.RELOAD    = uvm_reg_field::type_id::create("RELOAD");
		this.RELOAD.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 1); 

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

endclass: apb_RELOAD_c

`endif // SUV_APB_RELOAD_C

`ifndef SUV_APB_INTSTATUS_C
`define SUV_APB_INTSTATUS_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_INTSTATUS_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_1; // Reserved
	rand uvm_reg_field INTSTATUS; // Interrupt status 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_1: coverpoint Reserved_31_1.value[30:0]
		{
		`AUTO_COV_MIN_MAX(31)
		}
		INTSTATUS: coverpoint INTSTATUS.value[0:0]; 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_INTSTATUS_c)

	function new(string name = "unmapped-INTSTATUS");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_1    = uvm_reg_field::type_id::create("Reserved_31_1");
		this.INTSTATUS    = uvm_reg_field::type_id::create("INTSTATUS");
		this.Reserved_31_1.configure(this, 31, 1, "RO", 0, 'h0, 1, 1, 1);
		this.INTSTATUS.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_INTSTATUS_c

`endif // SUV_APB_INTSTATUS_C

`ifndef SUV_APB_INTCLEAR_C
`define SUV_APB_INTCLEAR_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_INTCLEAR_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_1; // Reserved
	rand uvm_reg_field INTCLEAR; // Write one to clear interrupt. 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_1: coverpoint Reserved_31_1.value[30:0]
		{
		`AUTO_COV_MIN_MAX(31)
		}
		INTCLEAR: coverpoint INTCLEAR.value[0:0]; 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_INTCLEAR_c)

	function new(string name = "unmapped-INTCLEAR");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_1    = uvm_reg_field::type_id::create("Reserved_31_1");
		this.INTCLEAR    = uvm_reg_field::type_id::create("INTCLEAR");
		this.Reserved_31_1.configure(this, 31, 1, "RO", 0, 'h0, 1, 1, 1);
		this.INTCLEAR.configure(this, 1, 0, "WO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_INTCLEAR_c

`endif // SUV_APB_INTCLEAR_C

`ifndef SUV_APB_PID4_C
`define SUV_APB_PID4_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID4_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field Block_count; // Block count
	rand uvm_reg_field jep106_c_code; // jep106_c_code 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		Block_count: coverpoint Block_count.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		}
		jep106_c_code: coverpoint jep106_c_code.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_PID4_c)

	function new(string name = "unmapped-PID4");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.Block_count    = uvm_reg_field::type_id::create("Block_count");
		this.jep106_c_code    = uvm_reg_field::type_id::create("jep106_c_code");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.Block_count.configure(this, 4, 4, "RO", 0, 'h0, 1, 1, 1);
		this.jep106_c_code.configure(this, 4, 0, "RO", 0, 'h4, 1, 1, 1); 

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

endclass: apb_PID4_c

`endif // SUV_APB_PID4_C

`ifndef SUV_APB_PID5_C
`define SUV_APB_PID5_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID5_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field PID5; // Peripheral identification register 5 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		PID5: coverpoint PID5.value[7:0]
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

	`uvm_object_utils(apb_PID5_c)

	function new(string name = "unmapped-PID5");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.PID5    = uvm_reg_field::type_id::create("PID5");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.PID5.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_PID5_c

`endif // SUV_APB_PID5_C

`ifndef SUV_APB_PID6_C
`define SUV_APB_PID6_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID6_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field PID6; // Peripheral identification register 6 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		PID6: coverpoint PID6.value[7:0]
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

	`uvm_object_utils(apb_PID6_c)

	function new(string name = "unmapped-PID6");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.PID6    = uvm_reg_field::type_id::create("PID6");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.PID6.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_PID6_c

`endif // SUV_APB_PID6_C

`ifndef SUV_APB_PID7_C
`define SUV_APB_PID7_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID7_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field PID7; // Peripheral identification register 7 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		PID7: coverpoint PID7.value[7:0]
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

	`uvm_object_utils(apb_PID7_c)

	function new(string name = "unmapped-PID7");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.PID7    = uvm_reg_field::type_id::create("PID7");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.PID7.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_PID7_c

`endif // SUV_APB_PID7_C

`ifndef SUV_APB_PID0_C
`define SUV_APB_PID0_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID0_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field PID0; // Part number[7:0] 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		PID0: coverpoint PID0.value[7:0]
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

	`uvm_object_utils(apb_PID0_c)

	function new(string name = "unmapped-PID0");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.PID0    = uvm_reg_field::type_id::create("PID0");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.PID0.configure(this, 8, 0, "RO", 0, 'h22, 1, 1, 1); 

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

endclass: apb_PID0_c

`endif // SUV_APB_PID0_C

`ifndef SUV_APB_PID1_C
`define SUV_APB_PID1_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID1_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field jep106_id_3_0; // jep106_id_3_0
	rand uvm_reg_field Part_number_11_8; // Part number [11:8] 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		jep106_id_3_0: coverpoint jep106_id_3_0.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		}
		Part_number_11_8: coverpoint Part_number_11_8.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_PID1_c)

	function new(string name = "unmapped-PID1");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.jep106_id_3_0    = uvm_reg_field::type_id::create("jep106_id_3_0");
		this.Part_number_11_8    = uvm_reg_field::type_id::create("Part_number_11_8");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.jep106_id_3_0.configure(this, 4, 4, "RO", 0, 'hb, 1, 1, 1);
		this.Part_number_11_8.configure(this, 4, 0, "RO", 0, 'h8, 1, 1, 1); 

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

endclass: apb_PID1_c

`endif // SUV_APB_PID1_C

`ifndef SUV_APB_PID2_C
`define SUV_APB_PID2_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID2_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field Revision; // Revision
	rand uvm_reg_field jedec_used; // jedec_used
	rand uvm_reg_field jep106_id_6_4; // jep106_id_6_4 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		Revision: coverpoint Revision.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		}
		jedec_used: coverpoint jedec_used.value[0:0];
		jep106_id_6_4: coverpoint jep106_id_6_4.value[2:0]
		{
		`AUTO_COV_MIN_MAX(3)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_PID2_c)

	function new(string name = "unmapped-PID2");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.Revision    = uvm_reg_field::type_id::create("Revision");
		this.jedec_used    = uvm_reg_field::type_id::create("jedec_used");
		this.jep106_id_6_4    = uvm_reg_field::type_id::create("jep106_id_6_4");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.Revision.configure(this, 4, 4, "RO", 0, 'h1, 1, 1, 1);
		this.jedec_used.configure(this, 1, 3, "RO", 0, 'h1, 1, 1, 1);
		this.jep106_id_6_4.configure(this, 3, 0, "RO", 0, 'h3, 1, 1, 1); 

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

endclass: apb_PID2_c

`endif // SUV_APB_PID2_C

`ifndef SUV_APB_PID3_C
`define SUV_APB_PID3_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_PID3_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field ECO_rev_num; // ECO revision number
	rand uvm_reg_field Cust_mod_num; // Customer modification number 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		ECO_rev_num: coverpoint ECO_rev_num.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		}
		Cust_mod_num: coverpoint Cust_mod_num.value[3:0]
		{
		`AUTO_COV_MIN_MAX(4)
		} 

	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(apb_PID3_c)

	function new(string name = "unmapped-PID3");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.ECO_rev_num    = uvm_reg_field::type_id::create("ECO_rev_num");
		this.Cust_mod_num    = uvm_reg_field::type_id::create("Cust_mod_num");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.ECO_rev_num.configure(this, 4, 4, "RO", 0, 'h0, 1, 1, 1);
		this.Cust_mod_num.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 1); 

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

endclass: apb_PID3_c

`endif // SUV_APB_PID3_C

`ifndef SUV_APB_CID0_C
`define SUV_APB_CID0_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_CID0_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field CID0; // Component identification register 0 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		CID0: coverpoint CID0.value[7:0]
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

	`uvm_object_utils(apb_CID0_c)

	function new(string name = "unmapped-CID0");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.CID0    = uvm_reg_field::type_id::create("CID0");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.CID0.configure(this, 8, 0, "RO", 0, 'hd, 1, 1, 1); 

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

endclass: apb_CID0_c

`endif // SUV_APB_CID0_C

`ifndef SUV_APB_CID1_C
`define SUV_APB_CID1_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_CID1_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field CID1; // Component identification register 1 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		CID1: coverpoint CID1.value[7:0]
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

	`uvm_object_utils(apb_CID1_c)

	function new(string name = "unmapped-CID1");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.CID1    = uvm_reg_field::type_id::create("CID1");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.CID1.configure(this, 8, 0, "RO", 0, 'hf0, 1, 1, 1); 

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

endclass: apb_CID1_c

`endif // SUV_APB_CID1_C

`ifndef SUV_APB_CID2_C
`define SUV_APB_CID2_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_CID2_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field CID2; // Component identification register 2 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		CID2: coverpoint CID2.value[7:0]
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

	`uvm_object_utils(apb_CID2_c)

	function new(string name = "unmapped-CID2");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.CID2    = uvm_reg_field::type_id::create("CID2");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.CID2.configure(this, 8, 0, "RO", 0, 'h5, 1, 1, 1); 

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

endclass: apb_CID2_c

`endif // SUV_APB_CID2_C

`ifndef SUV_APB_CID3_C
`define SUV_APB_CID3_C

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e;
`endif //CSV_REG_COVERAGE_MODEL_E

class apb_CID3_c extends uvm_reg;
	rand uvm_reg_field Reserved_31_8; // Reserved
	rand uvm_reg_field CID3; // Component identification register 3 

	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;
		
		Reserved_31_8: coverpoint Reserved_31_8.value[23:0]
		{
		`AUTO_COV_MIN_MAX(24)
		}
		CID3: coverpoint CID3.value[7:0]
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

	`uvm_object_utils(apb_CID3_c)

	function new(string name = "unmapped-CID3");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		this.Reserved_31_8    = uvm_reg_field::type_id::create("Reserved_31_8");
		this.CID3    = uvm_reg_field::type_id::create("CID3");
		this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 'h0, 1, 1, 1);
		this.CID3.configure(this, 8, 0, "RO", 0, 'hb1, 1, 1, 1); 

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

endclass: apb_CID3_c

`endif // SUV_APB_CID3_C
`ifndef SUV_APB_REG_BLK_C
`define SUV_APB_REG_BLK_C

class apb_reg_blk_c extends uvm_reg_block; 
	rand apb_CTRL_c CTRL; 
	rand apb_VALUE_c VALUE; 
	rand apb_RELOAD_c RELOAD; 
	rand apb_INTSTATUS_c INTSTATUS; 
	rand apb_INTCLEAR_c INTCLEAR; 
	rand apb_PID4_c PID4; 
	rand apb_PID5_c PID5; 
	rand apb_PID6_c PID6; 
	rand apb_PID7_c PID7; 
	rand apb_PID0_c PID0; 
	rand apb_PID1_c PID1; 
	rand apb_PID2_c PID2; 
	rand apb_PID3_c PID3; 
	rand apb_CID0_c CID0; 
	rand apb_CID1_c CID1; 
	rand apb_CID2_c CID2; 
	rand apb_CID3_c CID3; 

	`uvm_object_utils(apb_reg_blk_c)

	function new(string name = "apb_reg_blk_c");
		super.new(name);
	endfunction	// new

	virtual function void build();

		default_map = create_map("default_map", `UVM_REG_DATA_WIDTH'h0, `UVM_REG_DATA_WIDTH/8, UVM_LITTLE_ENDIAN);
	 
		this.CTRL = apb_CTRL_c::type_id::create("CTRL");
		this.CTRL.configure(this, null);
		this.CTRL.build();
		default_map.add_reg(CTRL, 'h0x000);
	 
		this.VALUE = apb_VALUE_c::type_id::create("VALUE");
		this.VALUE.configure(this, null);
		this.VALUE.build();
		default_map.add_reg(VALUE, 'h0x004);
	 
		this.RELOAD = apb_RELOAD_c::type_id::create("RELOAD");
		this.RELOAD.configure(this, null);
		this.RELOAD.build();
		default_map.add_reg(RELOAD, 'h0x008);
	 
		this.INTSTATUS = apb_INTSTATUS_c::type_id::create("INTSTATUS");
		this.INTSTATUS.configure(this, null);
		this.INTSTATUS.build();
		default_map.add_reg(INTSTATUS, 'h0x00C);
	 
		this.INTCLEAR = apb_INTCLEAR_c::type_id::create("INTCLEAR");
		this.INTCLEAR.configure(this, null);
		this.INTCLEAR.build();
		default_map.add_reg(INTCLEAR, 'h0x00C);
	 
		this.PID4 = apb_PID4_c::type_id::create("PID4");
		this.PID4.configure(this, null);
		this.PID4.build();
		default_map.add_reg(PID4, 'h0xFD0);
	 
		this.PID5 = apb_PID5_c::type_id::create("PID5");
		this.PID5.configure(this, null);
		this.PID5.build();
		default_map.add_reg(PID5, 'h0xFD4);
	 
		this.PID6 = apb_PID6_c::type_id::create("PID6");
		this.PID6.configure(this, null);
		this.PID6.build();
		default_map.add_reg(PID6, 'h0xFD8);
	 
		this.PID7 = apb_PID7_c::type_id::create("PID7");
		this.PID7.configure(this, null);
		this.PID7.build();
		default_map.add_reg(PID7, 'h0xFDC);
	 
		this.PID0 = apb_PID0_c::type_id::create("PID0");
		this.PID0.configure(this, null);
		this.PID0.build();
		default_map.add_reg(PID0, 'h0xFE0);
	 
		this.PID1 = apb_PID1_c::type_id::create("PID1");
		this.PID1.configure(this, null);
		this.PID1.build();
		default_map.add_reg(PID1, 'h0xFE4);
	 
		this.PID2 = apb_PID2_c::type_id::create("PID2");
		this.PID2.configure(this, null);
		this.PID2.build();
		default_map.add_reg(PID2, 'h0xFE8);
	 
		this.PID3 = apb_PID3_c::type_id::create("PID3");
		this.PID3.configure(this, null);
		this.PID3.build();
		default_map.add_reg(PID3, 'h0xFEC);
	 
		this.CID0 = apb_CID0_c::type_id::create("CID0");
		this.CID0.configure(this, null);
		this.CID0.build();
		default_map.add_reg(CID0, 'h0xFF0);
	 
		this.CID1 = apb_CID1_c::type_id::create("CID1");
		this.CID1.configure(this, null);
		this.CID1.build();
		default_map.add_reg(CID1, 'h0xFF4);
	 
		this.CID2 = apb_CID2_c::type_id::create("CID2");
		this.CID2.configure(this, null);
		this.CID2.build();
		default_map.add_reg(CID2, 'h0xFF8);
	 
		this.CID3 = apb_CID3_c::type_id::create("CID3");
		this.CID3.configure(this, null);
		this.CID3.build();
		default_map.add_reg(CID3, 'h0xFFC);
	 

	endfunction	// build

	virtual function void set_sequence_base(uvm_sequence_base parent = null); 
		CTRL.set_sequence_base(parent); 
		VALUE.set_sequence_base(parent); 
		RELOAD.set_sequence_base(parent); 
		INTSTATUS.set_sequence_base(parent); 
		INTCLEAR.set_sequence_base(parent); 
		PID4.set_sequence_base(parent); 
		PID5.set_sequence_base(parent); 
		PID6.set_sequence_base(parent); 
		PID7.set_sequence_base(parent); 
		PID0.set_sequence_base(parent); 
		PID1.set_sequence_base(parent); 
		PID2.set_sequence_base(parent); 
		PID3.set_sequence_base(parent); 
		CID0.set_sequence_base(parent); 
		CID1.set_sequence_base(parent); 
		CID2.set_sequence_base(parent); 
		CID3.set_sequence_base(parent); 
	endfunction	// set_sequence_base

endclass: apb_reg_blk_c

`endif // SUV_APB_REG_BLK_C