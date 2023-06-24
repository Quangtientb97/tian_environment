// Define parameter
// `include "__SUB__defines.svh"

// Define interface construct
`include "__SUB__master_intf.sv"
`include "__SUB__slave_intf.sv"

package __SUB__pkg;
	// Import UVM package
	import uvm_pkg::*;
	`include "uvm_macros.svh"

	// Define parameter
	`include "__SUB__defines.sv"

	// Define enumerated types
	`include "__SUB__types.svh"

	// Define configuaration variables
	`include "__SUB__config.sv"

	// Define sequence item for master and slave
	`include "__SUB__trans.sv"

	// Define base class of monitor
	// `include "__SUB__monitor.sv"

	// Define base class of agent
	`include "__SUB__agent.sv"

	// --------------
	// MASTER
	// --------------
	// Define master monitor
	`include "__SUB__master_monitor.sv"

	// Define master sequencer
	`include "__SUB__master_sequencer.sv"

	// Define master driver
	`include "__SUB__master_driver.sv"

	// Define master agent
	`include "__SUB__master.sv"

	// --------------
	// SLAVE
	// --------------
	// Define slave monitor
	`include "__SUB__slave_monitor.sv"

	// Define slave sequencer
	`include "__SUB__slave_sequencer.sv"

	// Define slave driver
	`include "__SUB__slave_driver.sv"

	// Define slave agent
	`include "__SUB__slave.sv"


	// Define enviroment class
	`include "__SUB__env.sv"

	// Define sequence library
	`include "__SUB__sequence.sv"

endpackage


