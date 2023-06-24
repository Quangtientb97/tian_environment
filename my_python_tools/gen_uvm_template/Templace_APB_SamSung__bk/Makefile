#   Compilation switches
compile_switches    =-full64
compile_switches   +=-debug_access+all
compile_switches   +=-sverilog
compile_switches   +=-timescale="1ns/100ps"

#   UVM switches
compile_switches   +=-ntb_opts uvm-1.2
compile_switches   +=+incdir+./sv
compile_switches   +=+incdir+./tb

#compile_files +=./sv/__SUB__master_intf.sv
#compile_files +=./sv/__SUB__slave_intf.sv
compile_files +=./sv/__SUB__pkg.sv
compile_files +=./tb/top.sv

run_switches  = +UVM_TESTNAME=basic_test_c
run_switches += -l sim.log
run_switches += +UVM_VERBOSITY=UVM_FULL
run_switches += +dumpvars+top.vcd

#   Make targets
sim: compile run

compile:
	rm -rf csrc
	rm -rf simv.*
	rm -rf DVE*
	rm -rf *.log
	rm -rf *.vpd
	vcs ${compile_switches} ${compile_files}

run:
	./simv ${run_switches}

wave:
	dve -mode64 -vpd hw_top.vpd
