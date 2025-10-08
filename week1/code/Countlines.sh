#!/bin/bash

if [[ -e "$1" ]]; then 

NumLines=`wc -l < $1`
echo
echo "The file $1 has $NumLines lines"
echo
exit

else
echo " Please provide a valid file"
exit
fi