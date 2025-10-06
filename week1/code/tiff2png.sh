#!/bin/bash

for f in *.tif;
do
echo "Converting $f";
magick "$f" "$(basename "$f" .tif).png";
done