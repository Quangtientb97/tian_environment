// --------------------------------------------
// File Name   : reg_def_defines.sv
// Description :
// Developers  :
// Created     :
// Generator   : csv_regdef
// --------------------------------------------

`ifndef SUV_REG_DEF_DEFINES
`define SUV_REG_DEF_DEFINES

//--------------------------------------------------------
//  Define address map. 
//--------------------------------------------------------
`ifndef SEC_REG_BOOT_BASE_ADDR
`define SEC_REG_BOOT_BASE_ADDR 'h0000_0000
`endif // SEC_REG_BOOT_BASE_ADDR

`define UVM_REG_DATA_WIDTH 32

`define SEC_REG_REG_BLK_0_BASE_ADDR 'h03
`define SEC_REG_REG_BLK_1_BASE_ADDR 'h03
`define SEC_REG_REG_BLK_2_BASE_ADDR 'h03
`define SEC_REG_REG_BLK_3_BASE_ADDR 'h03
`define SEC_REG_REG_BLK_4_BASE_ADDR 'h03

//--------------------------------------------------------
//  Define built-in coverage macros. 
//--------------------------------------------------------

// Coverage bins for min, mid, max
// Min, max value depend on 'VAL' parameter.
`define AUTO_COV_MIN_MAX(VAL) \
	bins min = {0}; \
	bins mid = {[1:2**VAL-2]}; \
	bins max = {2**VAL-1};

// Coverage bins for min, max
// Min, max value depend on 'VAL' parameter.
`define AUTO_COV_CORNER(VAL) \
	bins min = {0}; \
	bins max = {2**VAL-1};

// Coverage bins for specific value.
// Bins depend on 'VAL' parameter.
`define AUTO_COV_VAL(VAL) \
	bins valid[] = ``VAL``;

`define AUTO_COV_DEF(VAL) \
	`AUTO_COV_VAL(VAL)

// Coverage bins for excluding specific value
// Bin depend on 'VAL' parameter
// Only 1 bin is generated by 'auto_bin_max = 1'
`define AUTO_COV_EX_VAL(VAL) \
	option.auto_bin_max = 1; \
	ignore_bins invalid = ``VAL``;

// Coverage bin for one value.
`define AUTO_COV_ONE \
	bins valid = {1};

// Coverage bin for zero value.
`define AUTO_COV_ZERO \
	bins valid = {0};

// Coverage bins for specific value
// Bins are generated by regular size according to 'VAL'
`define AUTO_COV_BIN_MAX(VAL) \
	option.auto_bin_max = VAL;

`define AUTO_COV_DEF_MIN_MAX(VAL) \
	bins min = {[0:VAL-1]};\
	bins def = {VAL};\
	bins max = {[VAL+1:$]};

`define AUTO_COV_DEF_MIN(VAL) \
	bins min = {[0:VAL-1]};\
	bins def = {VAL};

`define AUTO_COV_DEF_OTHER(VAL) \
	bins def = {VAL}; \ 
	bins others = {[0:VAL-1], [VAL+1:$]};

`define AUTO_COV_ZERO_OTHER \
	bins def = {0}; \
	bins others = {[1:$]};

`endif //SUV_REG_DEF_DEFINES
