#---------------------------------------
# 	Location & Variable
#---------------------------------------
PRJ_HOME     = ${shell pwd}
RTL_HOME     = ${PRJ_HOME}/rtl
SV_HOME      = ${PRJ_HOME}/sv
TB_HOME      = ${PRJ_HOME}/tb
SIM_HOME     = ${PRJ_HOME}/SIM
UVM_TESTNAME = apb_base_test

#---------------------------------------
#  Compilation switches
#---------------------------------------
compile_switches    =-full64
compile_switches   +=-debug_access+all
compile_switches   +=-sverilog
compile_switches   +=-timescale="1ns/100ps"

#  |-- UVM switches
compile_switches   +=-ntb_opts uvm-1.2
compile_switches   +=-cm line+cond+fsm+tgl+branch+assert

compile_switches   +=+incdir+${PRJ_HOME}/sv
compile_switches   +=+incdir+${PRJ_HOME}/tb
compile_switches   +=+incdir+${PRJ_HOME}/rtl
compile_switches   +=+incdir+${PRJ_HOME}/lib/csv_apb
compile_switches   +=+incdir+${PRJ_HOME}/include/sverilog
compile_switches   +=+incdir+${PRJ_HOME}/source/sverilog/vcs
compile_switches   +=+incdir+${PRJ_HOME}/src/sverilog/vcs/

compile_switches   +=+define+SVT_AMBA_INTERFACE_METHOD_DISABLE
compile_switches   +=+define+SVT_APB_INCLUDE_USER_DEFINES
compile_switches   +=+define+SVT_UVM_TECHNOLOGY
compile_switches   +=+define+SYNOPSYS_SV
compile_switches   +=+define+UVM_DISABLE_AUTO_ITEM_RECORDING

compile_switches   +=-l compile.log

#  |-- Compilation files
compile_files += -f ${RTL_HOME}/vcode.f
compile_files +=${TB_HOME}/prim_files.sv
compile_files +=${TB_HOME}/top.sv


#---------------------------------------
#   Run switches
#---------------------------------------
run_switches += +UVM_VERBOSITY=UVM_LOW
run_switches += -debug_access
run_switches += -cm line+cond+fsm+tgl+branch+assert
run_switches += -l sim.log

#   Make targets
sim: compile run

compile:
	mkdir -p ${SIM_HOME}/compile;\
	cd ${SIM_HOME}/compile;\
	vcs ${compile_switches} ${compile_files} 

run:
	rm -rf ${SIM_HOME}/${UVM_TESTNAME};
	mkdir -p ${SIM_HOME}/${UVM_TESTNAME};
	cd ${SIM_HOME}/${UVM_TESTNAME} ;\
		${SIM_HOME}/compile/simv ${run_switches} +UVM_TESTNAME=${UVM_TESTNAME}
	@echo ""
	@echo "---------------------------------------------------------------------------";
	@echo "Please refer log file in: ${SIM_HOME}/${UVM_TESTNAME}/sim.log";
	@echo "---------------------------------------------------------------------------";

wave:
	verdi -f ${RTL_HOME}/vcode.f

clean:
	rm -rf ${SIM_HOME}/*

