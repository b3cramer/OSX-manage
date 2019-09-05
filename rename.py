#!/bin/python

import subprocess
import sys

newName = sys.argv[1]

def renameSystem(newName):
	subprocess.call(["scutil", "--set", "ComputerName", newName])

renameSystem(newName)

new = subprocess.check_output(["scutil", "--get", "ComputerName"])

print(new)
