#!/usr/bin/env python
import os
import os.path
import glob
import sys

if len(sys.argv) == 2:
    dotfiles = sys.argv[1]
else:
    dotfiles = os.path.dirname(os.path.realpath(__file__))
homedir = os.path.expanduser("~")

for orig in glob.glob(os.path.join(dotfiles, "dot_*")):
    dest = os.path.join(homedir, os.path.split(orig)[-1].replace("dot_", "."))
    print "Setting up " + dest + " for " + orig
    if os.path.lexists(dest):
        os.remove(dest)
    os.symlink(orig, dest)
