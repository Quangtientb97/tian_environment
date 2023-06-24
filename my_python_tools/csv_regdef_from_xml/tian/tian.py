import os
import re
import sys
import subprocess

# how to use
# import os
# import re
# import sys
# import subprocess
# import sys.path.append("__LINK__")
# import tian

#----------------------------------------------
# Function
#----------------------------------------------
# is exist
def is_exist(key, string):
    result = re.findall(key, string)
    if result != []:
        return 1
    else:
        return 0

# Get result from system command
def run(command, mode = "list"):
    p = subprocess.Popen([command], stdout=subprocess.PIPE, shell=True)
    string = p.stdout.read()
    output = string.split("\n")
    if mode == "list":
        if len(output) == 2:
            return output[0]
        else:
            output.pop()
            return output
    elif mode == "string":
        return string

# read file
def read_file(link_file):
   out = []
   r = open(link_file, "r")
   for line in r:
      out.append(line)
   r.close()
   return out

# write file
def write_file(link_file, wdata):
   w = open(link_file, "w")
   for line in wdata:
      w.write(line)
   w.close()
   return 0

# sub in file 
#---------------------------------------------------
# do not use regular expression
# should use [_fill_]* to present regular expression
def sub_in_file(link_file, old, new):
    out = []
    print("{}   :   {}   -->   {}".format(link_file, old, new))
    old = old.replace("/", "\/")
    new = new.replace("/", "\/")
    run("sed -i 's/{}/{}/g' {}".format(old, new, link_file))

# sub in list 
#---------------------------------------------------
# do not use regular expression
# should use [_fill_]* to present regular expression
def sub_in_list(list_name, old, new):
    out = []
    for line in list_name:
        line = re.sub(old, new, line)
        out.append(line)
    return out

# delete in file
def delete_in_file(link_file, keyword):
    out = []
    print("{}   :   delete --> {}".format(link_file, keyword))
    keyword = keyword.replace("/", "\/")
    run("sed -i '/{}/d' {}".format(keyword, link_file))

# search in file
def search_in_file(link_file, string):
   data_file = read_file(link_file)

   for line in data_file:
      result = re.findall(string, line)
      if result != []:
         for i_result in result:
            print(i_result)

# chomp
def chomp(string):
   string = string.replace("\n", "")
   return string

# sub line to list
def sub_string_to_list(string, list_main, list_sub):
    out = []
    for line in list_main:
        if (is_exist(string, line)):
            for line_in_list_sub in list_sub:
                out.append(line_in_list_sub)
            continue
        out.append(line)
    return out

# print file
def print_file(link_file):
    for i in read_file(link_file):
        i = i.replace("\n", "")
        print i

# print list
def print_list(list_name):
    for i in read_list(link_name):
        i = i.replace("\n", "")
        print i





