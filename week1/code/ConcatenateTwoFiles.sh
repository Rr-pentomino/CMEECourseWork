#!/bin/bash

if [[ -f "$1" && -f "$2" ]]; then 

cat "$1" > "$3"
cat "$2" >> "$3"

echo "Merged file is"
cat "$3"

exit

else 

echo " Please provide 2 existing files to concatenate "

exit

fi