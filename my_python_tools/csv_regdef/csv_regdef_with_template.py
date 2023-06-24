import os, re, sys, subprocess
import xml.dom.minidom
import xml.etree.ElementTree as ET


sys.path.append("/coasiasemi/home/tientq/csv_regdef/tian/")
import tian

home = ""
source_location = "/coasiasemi/home/tientq/csv_regdef/"

#-----------------------------------------------
# function
#-----------------------------------------------
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
# endfunction

#--------------------------------------------------------
#  sub function
#--------------------------------------------------------
def gen_ip_reg_def(link_xml, dir_output):
	# get data from xml file
	doc = xml.dom.minidom.parse(link_xml)
	tree = ET.parse(link_xml)
	root = tree.getroot()
	# dump file name


	name_blk_regdef = root.find('name').text
	print "name_blk_regdef:"
	print name_blk_regdef
	if dir_output == "":
		if os.path.exists("./csv_ip_regdef") == 0:
			tian.run("mkdir ./csv_ip_regdef")
		file_out_link = "./csv_ip_regdef/{}_reg_blk.sv".format(name_blk_regdef)
	else:
		if dir_output[-1] != '/':
			dir_output = dir_output + '/'
		if os.path.exists("{}/csv_ip_regdef".format(dir_output)) == 0:
			tian.run("mkdir {}/csv_ip_regdef".format(dir_output))
		file_out_link = dir_output + "csv_ip_regdef/{}_reg_blk.sv".format(name_blk_regdef)

	file_out = []

	HEADER = """\
//--------------------------------------------------------
// File Name   : __1___reg_def.sv
// Description : __1__ register definition
// Developers  : tian(tientq@coasia.com)
// Created	 :
// Generator   : csv_regdef
//--------------------------------------------------------\n"""

	HEADER = HEADER.replace("__1__", name_blk_regdef)
	file_out.append(HEADER)
	
	for addressBlock in root.iter('addressBlock'):
		# foreach register in addressBlock
		for register in addressBlock.findall('register'):
			#variable
			is_exist_field_reset    = 0
			is_exist_register_reset = 0

			# property of register
			r_name		  = register.find('name').text
			print "register name" + r_name
			#r_description   = register.find('description').text
			r_addressOffset = register.find('addressOffset').text
			r_size		  = register.find('size').text
			r_access_type   = register.find('access').text

			if register.findall('reset') != []:
				for reset in register.findall('reset'):
					print reset.find('value').text
				r_reset_value = reset.find('value').text
				is_exist_register_reset = 1
			if register.findall('field') != []:
				for field in register.findall('field'):
					r_field_name      = field.find('name').text
					r_field_bitOffset = field.find('bitOffset').text
					r_field_bitWidth  = field.find('bitWidth').text
					#r_field_access    = field.find('access').text
					if field.findall('resets') != []:
						is_exist_field_reset = 1
						print "has field reset"
			#--------------------------------------------------------
			#  Start write to file  
			#--------------------------------------------------------
			register_data = []

			register_data = tian.read_file(source_location + "/lib/template_uvm_reg.sv")

			register_data = tian.sub_in_list(register_data, "__NAME_REGISTER_DEFINE__"	   , "SUV_{}_{}_C".format(name_blk_regdef.upper(), r_name.upper()))
			register_data = tian.sub_in_list(register_data, "__REGISTER_NAME__"			  , "{}_{}".format(name_blk_regdef, r_name))
			register_data = tian.sub_in_list(register_data, "__REGISTER_NAME_WITH_BLK_NAME__", "{}".format(r_name))

			UVM_FIELD_PROPERTY = []
			if register.findall('field') != []:
				for field in register.findall('field'):
					r_field_name = field.find('name').text.lower()
					UVM_FIELD_PROPERTY.append("\trand uvm_reg_field {};\n".format(r_field_name))
			else:
				r_field_name = "{}".format(r_name)
				UVM_FIELD_PROPERTY_ITEM.replace("__1__", r_field_name)
				UVM_FIELD_PROPERTY.append(UVM_FIELD_PROPERTY_ITEM)

			# configure register
			BUILD_UVM_FIELD = []
			if register.findall('field') != []:
				for field in register.findall('field'):
					r_field_name = field.find('name').text.lower()
					BUILD_UVM_FIELD.append("\t\tthis.{} = uvm_reg_field::type_id::create(\"{}\");\n".format(r_field_name, r_field_name))
			else:
				r_field_name = "{}".format(r_name)
				BUILD_UVM_FIELD.append("\t\tthis.{} = uvm_reg_field::type_id::create(\"{}\");\n".format(r_field_name, r_field_name))
				BUILD_UVM_FIELD.append("\t\tthis.{}.configure(this, {}, {}, \"{}\", 0, 'h{}, 1, 1, 1);\n".format(r_field_name, 32, 0, "RO", 0))

			for field in register.findall('field'):
				r_field_name      = field.find('name').text.lower()
				r_field_bitOffset = field.find('bitOffset').text.lower()
				r_field_bitWidth  = field.find('bitWidth').text.lower()
				r_field_access    = field.find('access').text.lower()
				if is_exist_register_reset:
					r_reset_value_bin = hex_to_bin(r_reset_value.replace("0x", ""))

				if r_field_access == "read-write": r_field_access = "RW"
				if r_field_access == "read-only" : r_field_access = "RO"
				if r_field_access == "write-only": r_field_access = "WO"

				r_field_bitOffset = int(r_field_bitOffset)
				r_field_bitWidth = int(r_field_bitWidth)

				# cause index in python and index in sv are different
				if is_exist_register_reset:
					if 32-r_field_bitOffset-r_field_bitWidth != 32-r_field_bitOffset:
						r_field_reset_value = r_reset_value_bin[(32-r_field_bitOffset-r_field_bitWidth) : (32-r_field_bitOffset)]
					else:
						r_field_reset_value = r_reset_value_bin[32-r_field_bitOffset]
					r_field_reset_value = bin_to_hex(r_field_reset_value)
				else:
					#TBD
					r_field_reset_value = 0


				BUILD_UVM_FIELD.append("\t\tthis.{}.configure(this, {}, {}, \"{}\", 0, 'h{}, 1, 1, 1);\n".format(r_field_name, r_field_bitWidth, r_field_bitOffset, r_field_access, r_field_reset_value))
				
			# __COVER_POINT__
			COVER_POINT = []
			for field in register.findall('field'):
				r_field_name	  = field.find('name').text.lower()
				r_field_bitOffset = field.find('bitOffset').text
				r_field_bitWidth  = field.find('bitWidth').text
				r_field_access	= field.find('access').text
				if r_field_access != "read-only":
					if r_field_bitWidth == "1":
						COVER_POINT.append("\t\t{}: coverpoint {}.value[0:0];\n".format(r_field_name, r_field_name))
					else:
						COVER_POINT.append("\t\t{}: coverpoint {}.value[{}:{}]\n".format(r_field_name, r_field_name, int(r_field_bitWidth)-1, 0))
						COVER_POINT.append("\t\t{\n")
						COVER_POINT.append("\t\t`AUTO_COV_MIN_MAX({})\n".format(int(r_field_bitWidth)))
						COVER_POINT.append("\t\t}\n\n")

			register_data = tian.sub_string_to_list("__UVM_FIELD_PROPERTY__", register_data, UVM_FIELD_PROPERTY)
			register_data = tian.sub_string_to_list("__BUILD_UVM_FIELD__", register_data, BUILD_UVM_FIELD)
			register_data = tian.sub_string_to_list("__COVER_POINT__", register_data, COVER_POINT)

			for line in register_data:
				file_out.append(line)

	print(file_out_link)
	tian.write_file(file_out_link, file_out)

	# part 2
	file_out = []
	for addressBlock in root.iter('addressBlock'):
		# Start write to file
		register_data = []
		register_data = tian.read_file(source_location + "/lib/template_uvm_reg_build.sv")

		register_data = tian.sub_in_list(register_data, "SUV___NAME_BLK___REG_BLK_C", "SUV_{}_REG_BLK_C".format(name_blk_regdef.upper()))
		register_data = tian.sub_in_list(register_data, "__NAME_BLK___reg_blk_c", "{}_reg_blk_c".format(name_blk_regdef))
		register_data = tian.sub_in_list(register_data, "__NAME_BLK___reg_blk_c", "{}_reg_blk_c".format(name_blk_regdef))

		REG_BLK_C_PROPERTY = []
		BUILD_REGISTER = []
		SET_SEQ_BASE = []

		# foreach register
		for register in addressBlock.findall('register'):
			r_name = register.find('name').text.lower()
			r_addressOffset = register.find('addressOffset').text

			REG_BLK_C_PROPERTY.append("\trand {}_{}_c {};\n".format(name_blk_regdef, r_name, r_name))

			BUILD_REGISTER.append("\t\tthis.{} = {}_{}_c::type_id::create(\"{}\");\n".format(r_name, name_blk_regdef, r_name, r_name))
			BUILD_REGISTER.append("\t\tthis.{}.configure(this, Null);\n".format(r_name))
			BUILD_REGISTER.append("\t\tthis.{}.build();\n\n".format(r_name))

			BUILD_REGISTER.append("\t\tdefault_map.add_reg({}, 'h{});\n\n\n\n".format(r_name, r_addressOffset.replace("0x", "").replace("'h", "")))

			SET_SEQ_BASE.append("\t\t{}.set_sequence_base(parent);\n".format(r_name))

		register_data = tian.sub_string_to_list("__REG_BLK_C_PROPERTY__" , register_data , REG_BLK_C_PROPERTY)
		register_data = tian.sub_string_to_list("__BUILD_REGISTER__"     , register_data , BUILD_REGISTER)
		register_data = tian.sub_string_to_list("__SET_SEQ_BASE__"       , register_data , SET_SEQ_BASE)

		for line in register_data:
			file_out.append(line)
	
	tian.write_file(file_out_link + "part2", file_out)

	tian.run("cat {} >> {}".format(file_out_link + "part2", file_out_link))
	tian.run("rm -rf {}".format(file_out_link + "part2"))
	tian.run("cp -rf {}/lib/reg_def_defines.sv {}csv_ip_regdef/".format(source_location, dir_output))
	tian.run("sed -i 's/\r//g' {}".format(file_out_link))

def gen_soc_reg_def(link_config, dir_output):
	dir_output = dir_output + "csv_soc_reg_def"
	tian.run("rm -rf {}".format(dir_output))
	tian.run("mkdir {}".format(dir_output))

	config_file = tian.read_file(link_config)
	reg_blk_config_data = []
	for data_in_config_file in config_file:
		data_in_config_file = data_in_config_file.replace("\n", "")
		data_in_config_file = data_in_config_file.replace(" ", "")
		reg_blk_config_data.append(data_in_config_file.split(","))

	# make reg_blk.sv
	reg_blk_sv_text = tian.read_file(source_location + "/lib/reg_blk.sv")

	REG_BLK_C_PROPERTY = []
	for item in reg_blk_config_data:
		reg_blk_class  = item[1]
		reg_blk_object = item[2]
		REG_BLK_C_PROPERTY.append("\t`ifndef SUV_{}_FAKE\n".format(reg_blk_object.upper()))
		REG_BLK_C_PROPERTY.append("\trand {} {};\n".format(reg_blk_class, reg_blk_object))
		REG_BLK_C_PROPERTY.append("\t`endif // SUV_{}_FAKE\n\n".format(reg_blk_object.upper()))

	BUILD_REG_CLK_C_PROPERTY = []
	for item in reg_blk_config_data:
		reg_blk_class  = item[1]
		reg_blk_object = item[2]
		BUILD_REG_CLK_C_PROPERTY.append("\t\t`ifndef SUV_{}_FAKE\n".format(reg_blk_object.upper()))
		BUILD_REG_CLK_C_PROPERTY.append("\t\t{} = {}::type_id::create(\"{}\");\n".format(reg_blk_object, reg_blk_class, reg_blk_object))
		BUILD_REG_CLK_C_PROPERTY.append("\t\t{}.configure(this);\n".format(reg_blk_object))
		BUILD_REG_CLK_C_PROPERTY.append("\t\t{}.build();\n".format(reg_blk_object))
		BUILD_REG_CLK_C_PROPERTY.append("\t\taxi_map.add_submap(this.{}.default_map, `SEC_REG_{}_BASE_ADDR);\n".format(reg_blk_object, reg_blk_object.upper()))
		BUILD_REG_CLK_C_PROPERTY.append("\t\t`endif // SUV_{}_FAKE\n\n".format(reg_blk_object.upper()))

	SET_SEQ_BASE_PROPERTY = []
	for item in reg_blk_config_data:
		reg_blk_class  = item[1]
		reg_blk_object = item[2]
		SET_SEQ_BASE_PROPERTY.append("\t\t`ifndef SUV_{}_FAKE\n".format(reg_blk_object.upper()))
		SET_SEQ_BASE_PROPERTY.append("\t\t{}.set_sequence_base(parent);\n".format(reg_blk_object))
		SET_SEQ_BASE_PROPERTY.append("\t\t`endif // SUV_{}_FAKE\n\n".format(reg_blk_object.upper()))

	reg_blk_sv_text = tian.sub_string_to_list("__REG_BLK_C_PROPERTY__", reg_blk_sv_text, REG_BLK_C_PROPERTY)
	reg_blk_sv_text = tian.sub_string_to_list("__BUILD_REG_CLK_C_PROPERTY__", reg_blk_sv_text, BUILD_REG_CLK_C_PROPERTY)
	reg_blk_sv_text = tian.sub_string_to_list("__SET_SEQ_BASE_PROPERTY__", reg_blk_sv_text, SET_SEQ_BASE_PROPERTY)

	tian.write_file(dir_output + "/reg_blk.sv", reg_blk_sv_text)

	# make reg_def_defines.sv
	reg_def_defines_sv_text = tian.read_file(source_location + "/lib/reg_def_defines.sv")

	ADD_SUB_DEFINE = []
	for item in reg_blk_config_data:
		reg_blk_class  = item[1]
		reg_blk_object = item[2]
		reg_blk_base_addr = item[3].replace("0x", "'h")
		ADD_SUB_DEFINE.append("`define SEC_REG_{}_BASE_ADDR {}\n".format(reg_blk_object.upper(), reg_blk_base_addr))

	reg_def_defines_sv_text = tian.sub_string_to_list("__ADD_SUB_DEFINE__", reg_def_defines_sv_text, ADD_SUB_DEFINE)

	tian.write_file(dir_output + "/reg_def_defines.sv", reg_def_defines_sv_text)

	for item in reg_blk_config_data:
		reg_blk_xml = item[0]
		reg_blk_class = item[1]
		reg_blk_object = item[2]
		gen_ip_reg_def(reg_blk_xml, dir_output)
	
	# make reg_pkg.sv
	reg_pkg_sv_text = tian.read_file(source_location + "/lib/reg_pkg.sv")

	INCLUDE_REG_DEF_FILE = []
	for item in reg_blk_config_data:  
		reg_blk_class = item[1]
		reg_blk_object= item[2]
		INCLUDE_REG_DEF_FILE.append("\t`ifndef SUV_{}_FAKE\n".format(reg_blk_object.upper()))
		INCLUDE_REG_DEF_FILE.append("\t`include \"./csv_ip_regdef/{}.sv\"\n".format(reg_blk_class.replace("_c", "")))
		INCLUDE_REG_DEF_FILE.append("\t`endif // SUV_{}_FAKE\n\n".format(reg_blk_object.upper()))

	reg_pkg_sv_text = tian.sub_string_to_list("__INCLUDE_REG_DEF_FILE__", reg_pkg_sv_text, INCLUDE_REG_DEF_FILE)
	tian.write_file(dir_output + "/reg_pkg.sv", reg_pkg_sv_text)

#--------------------------------------------------------
# main() 
#--------------------------------------------------------
dir_output  = ""
link_xml	= ""
link_config = ""
gen_ip_xml  = 0
gen_soc_xml = 0

if len(sys.argv) == 1:
	tian.print_file("{}/lib/help.txt".format(source_location))

if len(sys.argv) > 1:
	while len(sys.argv) > 1:
		if sys.argv[1] == "-h":
			sys.argv.pop(1)
			tian.print_file("{}/lib/help.txt".format(source_location))
			continue

		if sys.argv[1] == "-IP":
			sys.argv.pop(1)
			link_xml = sys.argv.pop(1)
			gen_ip_xml = 1
			continue

		if sys.argv[1] == "-SOC":
			sys.argv.pop(1)
			link_config = sys.argv.pop(1)
			gen_soc_xml = 1
			continue

		if sys.argv[1] == "-file_out":
			sys.argv.pop(1)
			dir_output = sys.argv.pop(1)
			continue

if (gen_ip_xml):
	gen_ip_reg_def(link_xml, dir_output)

if (gen_soc_xml):
	gen_soc_reg_def(link_config, dir_output)

