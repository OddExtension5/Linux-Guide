#!/bin/bash

# $1 is the first number
# $2 is the operator
# $3 is the second number

let x="$1 $2 $3"
echo $x

# lets 1 + 3 (where $1 = 1, $2 = +, $3 = 3)
# 4
