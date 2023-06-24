import os, re, sys, subprocess
sys.path.append("/coasiasemi/home/tientq/csv_regdef/tian/")
sys.path.append("/coasiasemi/home/tientq/.local/lib/python3/site-packages/")
import openpyxl
from jinja2 import Template

import tian

def hex_to_bin(hex_string):
	hex_string = hex_string.replace("0", "0000")
	hex_string = hex_string.replace("1", "0001")
	hex_string = hex_string.replace("2", "0010")
	hex_string = hex_string.replace("3", "0011")
	hex_string = hex_string.replace("4", "0100")
	hex_string = hex_string.replace("5", "0101")
	hex_string = hex_string.replace("6", "0110")
	hex_string = hex_string.replace("7", "0111")
	hex_string = hex_string.replace("8", "1000")
	hex_string = hex_string.replace("9", "1001")
	hex_string = hex_string.replace("a", "1010")
	hex_string = hex_string.replace("b", "1011")
	hex_string = hex_string.replace("c", "1100")
	hex_string = hex_string.replace("d", "1101")
	hex_string = hex_string.replace("e", "1110")
	hex_string = hex_string.replace("f", "1111")
	while (len(hex_string) < 32):
		hex_string = '0' + hex_string
	return hex_string

def bin_to_hex(bin_string):
	decimal_str = int(bin_string, 2)
	hexa = hex(decimal_str)
	return hexa.replace("0x", "")

reg_data_done = ""
reg_blk_data_done = ""
with open('template_reg.jj2', 'r') as f:
	reg_data_raw = f.read()

with open('template_reg_blk.jj2', 'r') as f:
	reg_blk_data_raw = f.read()

workbook = openpyxl.load_workbook('regdef_base.xlsx')
sheet = 'yapp'

row_A = []

block_name = sheet
header_file = f"""
//--------------------------------------------------------
// File Name   : {block_name}_reg_def.sv
// Description : {block_name} register definition
// Developers  : tian(tientq@coasia.com)
// Created	   :
// Generator   : csv_regdef_from_exel
//--------------------------------------------------------
"""

for cell in workbook[sheet]['A']:
	if cell.row == 1:
		continue

	if cell.value != None:
		row_A.append(cell.row)

for index in range(0, len(row_A)):
	r_addr  = workbook[sheet]['A'+str(row_A[index])].value
	r_name  = workbook[sheet]['B'+str(row_A[index])].value
	r_reset = workbook[sheet]['C'+str(row_A[index])].value
	print("\n---------------------")
	print(r_name)
	print(r_addr)
	print(r_reset)

	row_cur = row_A[index]
	r_fields = []
	# Make register extends uvm_reg
	if (index < len(row_A)-1):
		while (row_cur < row_A[index+1]):
			field_range      = workbook[sheet]['D'+str(row_cur)].value
			if ':' in field_range:
				field_bitOffset = field_range.split(':')[1] 
				field_bitWidth  = int(field_range.split(':')[0]) - int(field_range.split(':')[1] ) + 1
			else:
				field_bitOffset = field_range
				field_bitWidth  = 1

			field_name        = workbook[sheet]['E'+str(row_cur)].value
			field_policy      = workbook[sheet]['F'+str(row_cur)].value
			field_description = workbook[sheet]['G'+str(row_cur)].value

			# get field reset
			# |--- cause index in python and index in sv are different
			field_bitOffset = int(field_bitOffset)
			field_bitWidth  = int(field_bitWidth)

			reset_value_bin = hex_to_bin(r_reset.replace("0x", ""))
			if 32-field_bitOffset-field_bitWidth != 32-field_bitOffset:
				field_reset_value = reset_value_bin[(32-field_bitOffset-field_bitWidth) : (32-field_bitOffset)]
			else:
				field_reset_value = reset_value_bin[32-field_bitOffset]
			field_reset_value = bin_to_hex(field_reset_value)

			# collect field data
			# |---                  0               1                2                3                   4
			r_fields.append([field_name, field_bitOffset, field_bitWidth, field_reset_value, field_description, field_policy])

			# count row_cur
			row_cur += 1
	if r_addr == 'end':
		break
	reg_data_done += Template(reg_data_raw).render(block_name=block_name, reg_name=r_name, r_fields=r_fields)
# endfor

registers = []
for index in range(0, len(row_A)):
	r_addr  = workbook[sheet]['A'+str(row_A[index])].value
	r_name  = workbook[sheet]['B'+str(row_A[index])].value
	if r_addr == 'end':
		break
	registers.append([r_addr, r_name])

reg_blk_data_done = Template(reg_blk_data_raw).render(registers=registers, block_name=block_name)



with open('done.sv', 'w') as f:
	f.write(header_file)
	f.write(reg_data_done)
	f.write(reg_blk_data_done)
	


	
	

