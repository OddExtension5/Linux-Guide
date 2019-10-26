#!/bin/bash
#
# Showing the use of shift

echo "The arguments provided are $*"
echo "The value of \$1 is $1"
echo "The entire string is $*"
shift
echo "The new value of \$1 is $1"
echo "The entire string now is S*"

exit
