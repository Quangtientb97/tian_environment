`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

//------------------------------------------------------------------------------
//
// SEQUENCE: base yapp sequence - base sequence with objections from which 
// all sequences can be derived
//
//------------------------------------------------------------------------------
class class_name_base_seq extends uvm_sequence #(PARAMETER_TYPE);
  
  // Required macro for sequences automation
  `uvm_object_utils(class_name_base_seq)

  // Constructor
  function new(string name="class_name_base_seq");
    super.new(name);
  endfunction

  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
    end
  endtask : post_body

endclass : class_name_base_seq

class class_name extends class_name_base_seq;
	//---------------------------------------------------------------------
	// 	Property
	//---------------------------------------------------------------------

	//---------------------------------------------------------------------
	// 	Factory
	//---------------------------------------------------------------------
	`uvm_object_utils_begin(class_name)
	`uvm_object_utils_end

	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "class_name");
		super.new(name);
	endfunction

	// Seqence body definition
	virtual task body();
		`uvm_info(get_full_name(), "[tientq]: start sequence ...", UVM_LOW);

	endtask

endclass

`endif

