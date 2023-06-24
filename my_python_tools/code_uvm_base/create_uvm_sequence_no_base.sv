`ifndef __NAME_DEFINE__
`define __NAME_DEFINE__

class class_name extends uvm_class_name;
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

