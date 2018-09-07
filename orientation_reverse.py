#!/usr/bin/env python
import os
import subprocess
import sys

DEF_TOP = ['../protein.psf', 'protein.psf','../step5_assembly.xplor_ext.psf']
OUT = 'orientation_reverse.log'
argv = sys.argv[1:]

# Check that the output will not overwrite existing file
if os.path.isfile(OUT):
  print("{} already exists, please rename or delete file.".format(OUT))
  exit(2)

if len(argv[:]) < 1:
  print("No arguments provided. Please include a psf and coordinate/trajectory file.")
  exit(2)
elif len(argv[:]) == 1:
  for TOP in DEF_TOP:
    if os.path.isfile(TOP):
      argv.append(argv[0])
      argv[0] = TOP
      break

subprocess.call(["vmd", "-e", "/home/xadams/bin/orientation_reverse.tcl", argv[0], argv[1]])
#subprocess.call(["remove_blank_lines.py", OUT])
