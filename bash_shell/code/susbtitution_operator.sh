#!/bin/bash

DATE=
echo DATE                           # date

echo ${DATE:-today}                 # today
echo $DATE                          

echo ${DATE:=today}                 # today
echo $DATE                          # today

unset DATE

echo ${DATE:?variable not set}      # -bash: DATE: variable not set
echo $DATE

DATE=$(date +%d-%m-%y)
echo the day is ${DATE:0:2}         # the day is 30

