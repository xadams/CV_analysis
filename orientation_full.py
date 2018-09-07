#!/usr/bin/env python
import os
import subprocess
import sys

DEF_TOP = ['protein.psf','../protein.psf','../step5_assembly.xplor_ext.psf']
OUT = 'orientation_full_double.log'
argv = sys.argv[1:]
arg_num = len(argv)

if arg_num == 1:
  for TOP in DEF_TOP:
    if os.path.isfile(TOP):
      argv.append(argv[0])
      argv[0] = TOP
      arg_num += 1
      break
if arg_num < 2:
  print("Insufficient arguments provided. Please include a psf and coordinate/trajectory file.")
  exit(2)
if os.path.isfile(OUT):
  print("{} already exists, please rename or delete file.".format(OUT))
  exit(2)

subprocess.call(["vmd", "-e", "/home/xadams/bin/orientation_full.tcl", argv[0], argv[1]])
#subprocess.call(["remove_blank_lines.py", "orientation_full.log"])
