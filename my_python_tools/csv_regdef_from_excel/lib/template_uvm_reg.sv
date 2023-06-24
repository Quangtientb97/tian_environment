

`ifndef __NAME_REGISTER_DEFINE__
`define __NAME_REGISTER_DEFINE__

`ifndef CSV_REG_COVERAGE_MODEL_E
`define CSV_REG_COVERAGE_MODEL_E
typedef enum {
	CSV_CVR_REG_DIRECTION = 'h0010
} csv_reg_coverage_model_e
`endif //CSV_REG_COVERAGE_MODEL_E

class __REGISTER_NAME___c extends uvm_reg;
	___UVM_FIELD_PROPERTY__
	// Field for blocking operation
	// This field is also used to solve the UVM limitation
	// which returns wrong value in mirror(), read() commands
	uvm_sequence_base seq_base;

	// Fields for coverage
	local uvm_access_e m_kind;

	covergroup cg_vals;
		option.per_instance = 1;

		// __COVER_POINT__
	endgroup

	covergroup cg_direction;
		option.per_instance = 1;
		direction: coverpoint m_kind{
			ignore_bins ignore_vals = {UVM_BURST_WRITE, UVM_BURST_READ};
		}

	endgroup

	`uvm_object_utils(__REGISTER_NAME___c)

	function new(string name = "unmapped-__REGISTER_NAME_WITH_BLK_NAME__");
		super.new(name, 32, build_coverage(csv_reg_coverage_model_e'(UVM_CVR_FIELD_VALS + CSV_CVR_REG_DIRECTION)));
		if (has_coverage(UVM_CVR_FIELD_VALS)) 
			cg_vals = new();

		if (has_coverage(CSV_CVR_REG_DIRECTION)) 
			cg_direction = new();
	endfunction: new

	virtual function void build();
		__BUILD_UVM_FIELD__

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

endclass: __REGISTER_NAME___c

`endif // __NAME_REGISTER_DEFINE__
