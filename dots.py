#!/usr/bin/env python
import os
import os.path
import glob
import sys

dotfiles = sys.argv[1]
homedir = sys.argv[2]

for orig in glob.glob( os.path.join(dotfiles, "dot_*") ):
    dest = os.path.join( homedir, os.path.split(orig)[-1].replace("dot_", "."))
    print "Setting up " + dest + " for " + orig
    if os.path.lexists(dest):
        os.remove(dest)
    os.symlink(orig, dest)
