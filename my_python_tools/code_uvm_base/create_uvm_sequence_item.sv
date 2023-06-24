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
	//`uvm_field_* all property
	`uvm_object_utils_end


	//---------------------------------------------------------------------
	// 	Constraint
	//---------------------------------------------------------------------
	// constraint __name_of_constraint__ {condition0; condition1;}


	//---------------------------------------------------------------------
	// 	Methods
	//---------------------------------------------------------------------
	// 	Contructor
	function new(string name = "class_name");
		super.new(name);
	endfunction

endclass

`endif

