import re, os, sys, readline
sys.path.append("/coasiasemi/home/tientq/python_dir") 
sys.path.append("/coasiasemi/home/tientq/.local/lib/python3/site-packages") 
import tian_lib as tian

import openpyxl
import xml.dom.minidom
import xml.etree.ElementTree as ET
from jinja2 import Template

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
	hex_string = hex_string.replace("A", "1010")
	hex_string = hex_string.replace("B", "1011")
	hex_string = hex_string.replace("C", "1100")
	hex_string = hex_string.replace("D", "1101")
	hex_string = hex_string.replace("E", "1110")
	hex_string = hex_string.replace("F", "1111")
	while (len(hex_string) < 32):
		hex_string = '0' + hex_string
	return hex_string

def bin_to_hex(bin_string):
	decimal_str = int(bin_string, 2)
	hexa = hex(decimal_str)
	return hexa.replace("0x", "")

reg_data_done = ""
reg_blk_data_done = ""
with open('lib/template_reg.jj2', 'r') as f:
	reg_data_raw = f.read()

with open('lib/template_reg_blk.jj2', 'r') as f:
	reg_blk_data_raw = f.read()

# get data from xml file
link_xml = "cmsdk_apb_timer.xml"
doc      = xml.dom.minidom.parse(link_xml)
tree     = ET.parse(link_xml)
root     = tree.getroot()

# dump block_name
block_name = root.find('name').text

header_file = f"""
//--------------------------------------------------------
// File Name   : {block_name}_reg_def.sv
// Description : {block_name} register definition
// Developers  : tian(tientq@coasia.com)
// Created	   :
// Generator   : csv_regdef_from_exel
//--------------------------------------------------------
"""

for addressBlock in root.iter('addressBlock'):
	# foreach register in addressBlock
	for register in addressBlock.findall('register'):
		#variable
		is_exist_field_reset    = 0
		is_exist_register_reset = 0

		# property of register
		r_name		    = register.find('name').text
		print ("register name: " + r_name)
		r_description   = register.find('description').text
		r_addressOffset = register.find('addressOffset').text
		r_size          = register.find('size').text
		r_access_type   = register.find('access').text

		if register.findall('reset') != []:
			for reset in register.findall('reset'):
				print (reset.find('value').text)
			r_reset_value = reset.find('value').text
			is_exist_register_reset = 1
			is_exist_field_reset    = 0
		
		# Gen r_fields
		r_fields = []
		if register.findall('field') != None:
			for field in register.findall('field'):
				r_field_name      	  = field.find('name').text
				r_field_bitOffset 	  = field.find('bitOffset').text
				r_field_bitWidth  	  = field.find('bitWidth').text
				r_field_access    	  = field.find('access').text
				r_field_description    = field.find('description').text
				if field.findall('resets') != None:
					is_exist_field_reset = 1

				if (is_exist_field_reset == 1):
					pass
				if (is_exist_register_reset == 1):
					reset_value_bin = hex_to_bin(r_reset_value.replace("0x", ""))

				# get field reset
				# |--- cause index in python and index in sv are different
				field_bitOffset = int(r_field_bitOffset)
				field_bitWidth  = int(r_field_bitWidth)
				if 32-field_bitOffset-field_bitWidth != 32-field_bitOffset:
					field_reset_value = reset_value_bin[(32-field_bitOffset-field_bitWidth) : (32-field_bitOffset)]
				else:
					field_reset_value = reset_value_bin[32-field_bitOffset]
				field_reset_value = bin_to_hex(field_reset_value)

				# convert r_field_access
				if r_field_access   == "read-only":
					r_field_access = "RO"
				elif r_field_access == "write-only":
					r_field_access = "WO"
				elif r_field_access == "read-write":
					r_field_access = "RW"


				# collect field data
				# |---                  0               1                2                3                   4
				r_fields.append([r_field_name, field_bitOffset, field_bitWidth, field_reset_value, r_field_description, r_field_access])

		# gen uvm_reg done
		reg_data_done += Template(reg_data_raw).render(block_name=block_name, reg_name=r_name, r_fields=r_fields)

registers = []
for addressBlock in root.iter('addressBlock'):
	# foreach register in addressBlock
	for register in addressBlock.findall('register'):
		#variable
		is_exist_field_reset    = 0
		is_exist_register_reset = 0

		# property of register
		r_name		    = register.find('name').text
		r_description   = register.find('description').text
		r_addressOffset = register.find('addressOffset').text
		r_size          = register.find('size').text
		r_access_type   = register.find('access').text

		registers.append([r_addressOffset, r_name])

reg_blk_data_done = Template(reg_blk_data_raw).render(registers=registers, block_name=block_name)


with open('done.sv', 'w') as f:
	f.write(header_file)
	f.write(reg_data_done)
	f.write(reg_blk_data_done)

tian.print_banner(f"Please copy {tian.BLUE}lib/reg_def_defines.sv{tian.RESET}")
	


	
	

