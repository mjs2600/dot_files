#!/usr/bin/env python
import os
import os.path
import glob

os.chdir(os.path.expanduser("~"))
for orig in glob.glob("dot_files/dot_*"):
    dest = os.path.split(orig)[1].replace("dot_", ".")
    print "Setting up " + dest
    if os.path.lexists(dest):
        os.remove(dest)
    os.symlink(orig, dest)

