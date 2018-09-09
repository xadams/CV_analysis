#!/usr/bin/env python
import os
import subprocess
import sys
from pathlib import Path

DEF_TOP = ['../protein.psf','protein.psf','../step5_assembly.xplor_ext.psf']
IF_FILES = ['../protein.psf', '../inoc_glucose.psf']
OF_FILES = ['protein.psf', 'protg.psf']
OUT_FILE = 'orientation_quat.log'

# Read in the home directory
home = str(Path.home())

# Read in command line arguments
argv = sys.argv[1:]
arg_num = len(argv[:])

# Check that the outputfile will not overwrite existing file
if os.path.isfile(OUT_FILE):
  print("{} already exists, please rename or delete file.".format(OUT_FILE))
  exit(2)

# Exit for no arguments, for one argument search for default topology files
if arg_num < 1:
  print("No arguments provided. Please include a psf and coordinate/trajectory file.")
  exit(2)
elif arg_num == 1:
  for TOP in DEF_TOP:
    if os.path.isfile(TOP):
      argv.append(argv[0])
      argv[0] = TOP
      break
if arg_num < 2:
    print("Insufficient arguments provided, please supply topology and trajectory file")
    exit(2)
# Determine reference files based on home directory and topology file
if argv[0] in IF_FILES:
    CV_IN = home + '/bin/tcl_scripts/orientation_quat_inoc.in'
elif argv[0] in OF_FILES:
    CV_IN = home + '/bin/tcl_scripts/orientation_quat_prot.in'
else:
    print("Exception: Unsure which ref file to use")
    exit(3)

subprocess.call(["vmd", "-e", "/home/xadams/bin/orientation_quat.tcl", argv[0], argv[1], "-args", CV_IN])
