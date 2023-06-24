#! /usr/bin/python3
import re, os, sys
sys.path.append("/coasiasemi/home/tientq/python_dir") 
sys.path.append("/coasiasemi/home/tientq/.local/lib/python3/site-packages/") 
from jinja2 import Template

template_location = "uvm_template"
tb_location       = "uvm_template/tb"
sv_location       = "uvm_template/sv"
env_name 			= ""

def help_func():
	print ("""
				Create UCVM template

			Option:
				-h                : help
				-dir <dir_output> : specific the output location

""")

def get_dir():
	get_dir = input("")

def gen_file(src_file, des_file):
	context = ""
	print (src_file)
	with open(src_file, 'r') as f:
		context = f.read()

	define_file = des_file.split('/')[-1]
	define_file = re.sub("\..*", "", define_file).upper() + "_C"

	template = Template(context)

	with open(des_file, 'w') as f:
		os.system(f"echo '' > {des_file}")
		f.write(template.render(define_file=define_file, env_name=env_name))

def make_env(home_dir=""):
	if home_dir=="": 
		print ("missing option -dir")
		exit()
	if os.path.exists(home_dir):
		print (f"{home_dir} existed. Please remove it first!")
		exit()

	os.system(f"mkdir {home_dir}")
	os.system(f"mkdir {home_dir}/tb")
	os.system(f"mkdir {home_dir}/rtl")
	os.system(f"mkdir {home_dir}/sim")

	gen_file(f"{tb_location}/basic_test.jj2" ,f"{home_dir}/tb/basic_test.sv")
	gen_file(f"{tb_location}/defines.jj2"    ,f"{home_dir}/tb/defines.sv")
	gen_file(f"{tb_location}/seqs_lib.jj2"   ,f"{home_dir}/tb/seqs_lib.sv")
	gen_file(f"{tb_location}/tb.jj2"         ,f"{home_dir}/tb/tb.sv")
	gen_file(f"{tb_location}/top.jj2"        ,f"{home_dir}/tb/top.sv")
	gen_file(f"{tb_location}/vseqr.jj2"      ,f"{home_dir}/tb/vseqr.sv")

# Variable
argv = sys.argv
home_dir=""

while (len(argv) > 1):
	if (argv[1] == '-h'):
		help_func()
		argv.pop(1)
		continue
	if (argv[1] == '-dir'):
		argv.pop(1)
		home_dir = argv.pop(1)
		continue

	else:
		exit()

env_name = input("env_name : ")
make_env(home_dir)
		


