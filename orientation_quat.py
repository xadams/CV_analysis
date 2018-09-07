#!/usr/bin/env python
import os
import subprocess
import sys

DEF_TOP = ['../protein.psf','protein.psf','../step5_assembly.xplor_ext.psf']
OUT = 'orientation_quat.log'
argv = sys.argv[1:]
arg_num = len(argv[:])

# Check that the outputfile will not overwrite existing file
if os.path.isfile(OUT):
  print("{} already exists, please rename or delete file.".format(OUT))
  exit(2)

if arg_num < 1:
  print("No arguments provided. Please include a psf and coordinate/trajectory file.")
  exit(2)
elif arg_num == 1:
  for TOP in DEF_TOP:
    if os.path.isfile(TOP):
      argv.append(argv[0])
      argv[0] = TOP
      break
if argv[0] == '../protein.psf':
    CV_IN = '/home/xadams/bin/orientation_quat_inoc.in'
elif argv[0] == 'protein.psf':
    CV_IN = '/home/xadams/bin/orientation_quat_prot.in'
else:
    print("Exception: Unsure which ref file to use")
    exit(3)

subprocess.call(["vmd", "-e", "/home/xadams/bin/orientation_quat.tcl", argv[0], argv[1], "-args", CV_IN])
