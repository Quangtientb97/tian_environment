`include "__SUB__defines.sv"
`include "uvm_macros.svh"

interface __SUB__slave_intf();
	import uvm_pkg::*;

	task foo_task();
		//TBD
	endtask

	function foo_function();
		// TBD
	endfunction

	//alway block
	//TBD
	//
	//assert block can be declare in there
endinterface
