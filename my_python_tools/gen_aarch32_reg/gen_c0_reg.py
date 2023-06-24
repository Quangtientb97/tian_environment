import re, os, sys
sys.path.append("/coasiasemi/home/tientq/python_dir") 
sys.path.append("/coasiasemi/home/tientq/.local/lib/python3/site-packages") 

import openpyxl
import tian_lib as tian


wb = openpyxl.load_workbook('aarch32_reg.xlsx')

sheet_names = wb.get_sheet_names()

out_file = []

out_file.append("#ifndef __MY_CPU__\n")
out_file.append("#define __MY_CPU__\n")
out_file.append("\n")
out_file.append("typedef unsigned int u32;\n")

for sheet in sheet_names:
	# for read
	out_file.append("//----------------------\n")
	out_file.append(f"// Read {sheet}\n")
	out_file.append("//----------------------\n")
	for A_cell in wb[sheet]['A']:
		if (A_cell.row < 3):
			continue
		row  = str(A_cell.row)
		Crn  = A_cell.value
		Op   = wb[sheet]['B'+row].value
		CR   = wb[sheet]['C'+row].value
		Op2  = wb[sheet]['D'+row].value
		Name = wb[sheet]['E'+row].value

		out_file.append(f"volatile unsigned int read_{Name}(void){{\n")
		out_file.append(f"\tunsigned int rdata;\n")
		out_file.append(f"\tasm volatile (\"MRC p15, {Op}, %[rdata], {Crn}, {CR}, {Op2}\" : [rdata] \"=r\" (rdata) :);\n")
		out_file.append(f"\treturn rdata;\n")
		out_file.append(f"}}\n\n")

	# for write
	out_file.append("//----------------------\n")
	out_file.append("// Write {sheet}\n")
	out_file.append("//----------------------\n")
	for A_cell in wb[sheet]['A']:
		if (A_cell.row < 3):
			continue
		row  = str(A_cell.row)
		Crn  = A_cell.value
		Op   = wb[sheet]['B'+row].value
		CR   = wb[sheet]['C'+row].value
		Op2  = wb[sheet]['D'+row].value
		Name = wb[sheet]['E'+row].value

		out_file.append(f"volatile unsigned int write_{Name}(unsigned int wdata){{\n")
		out_file.append(f"\tasm volatile (\"MCR p15, {Op}, %[wdata], {Crn}, {CR}, {Op2}\" :  :[wdata] \"r\" (wdata));\n")
		out_file.append(f"\treturn 0;\n")
		out_file.append(f"}}\n\n")

out_file.append("void writew(u32 address, u32 value){\n")
out_file.append("	asm volatile (\"STR %[value], [%[address]]\"\n")
out_file.append("			:\n")
out_file.append("			: [value] \"r\" (value), [address] \"r\" (address)\n")
out_file.append("	);\n")
out_file.append("}\n")

out_file.append("#endif")

# Write file
tian.write_file("cpu.c", out_file)

 
