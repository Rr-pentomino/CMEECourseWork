#!/bin/sh
# Author: Ahmet Selim Esmer ase225@ic.ac.uk
# Script: tabtocvs.sh
# Description: substitue the tabs in the files with commas
#
# Saves the output into a .cvs file 
# Arguments: 1 -> tab delimited file 
# Date: Oct 2025

echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "\t" "," >> $1.csv
echo "Done!"
exit