#!/usr/bin/bash -xv
#
#<Eneter comments or Code Algorithm>

#

# set strict mode . Causes shell to exit when command fails.

echo "====================================="
echo "     Set Variables"
echo "====================================="
set -e
#Enables printing  of shell input lines as they are read
set -v
#Enables print of command traces before executing command
set -x
# set a variable
variable="Test"

echo "This script variable is L $variable"
