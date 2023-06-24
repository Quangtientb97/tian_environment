
`include "defines.sv"
//`include "pkg.sv" // package of UVC

module top;
	import uvm_pkg::*;
	`include "uvm_macros.svh"

	import __SUB__pkg::*;
	`include "tb.sv"
	`include "seq_lib.sv"
	`include "basic_test.sv"

	// Define parameters
	parameter clock_period = `CLOCK_PERIOD;
	parameter PHASE_TIME = clock_period/ 2.0;
	parameter reset_cycle = `RESET_CYCLE;

	// Define clock & reset
	reg SystemClock;
	reg nReset;
	initial begin
		SystemClock = 0;
		forever begin
			#PHASE_TIME SystemClock = ~SystemClock;
		end
	end
	initial begin
		nReset = 0;
		for (integer i=0; i<reset_cycle; i=i+1) begin
			@(posedge SystemClock);
		end
		nReset = 1;
	end

	// Declare interface and connect
	__SUB__master_intf __SUB__master0_intf() ;
	__SUB__slave_intf  __SUB__slave0_intf()  ;
	__SUB__slave_intf  __SUB__slave1_intf()  ;
	// input of DUT will be driven by uvm_driver
	
	initial begin
		uvm_config_db#(virtual __SUB__master_intf)::set(null, "uvm_test_top.tb.__SUB__env.master.*" , "vintf", __SUB__master0_intf);
		uvm_config_db#(virtual __SUB__slave_intf)::set(null,  "uvm_test_top.tb.__SUB__env.slave[0].*", "vintf", __SUB__slave0_intf);
		uvm_config_db#(virtual __SUB__slave_intf)::set(null,  "uvm_test_top.tb.__SUB__env.slave[1].*", "vintf", __SUB__slave1_intf);
	end

	initial begin
		run_test();
	end

endmodule
