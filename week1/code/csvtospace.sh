#!/bin/sh
# Author: Ahmet Selim Esmer ase225@ic.ac.uk
# Script: cvstospace.sh
# Description: substitute the commas in the files with space
#
# Saves the output into a .csv file
# Arguments: 1 -> comma delimited file
# Date: Oct 2025


if [[ -e "$1" ]]; then

echo "Creating a space delimited version of $1 ..."

cat "$1" | tr -s "," " " > "${1%.csv}_space.txt"

echo "Done!"

exit

else 

echo "Please provide a valid file" 

exit

fi 