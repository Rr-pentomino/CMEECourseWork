#!/bin/bash

if ! command -v magick &> /dev/null; then 
    echo "ImageMagick could not be found, please install it to use this script."
    exit

fi


for f in *.tif;
do
echo "Converting $f";
magick "$f" "$(basename "$f" .tif).png";
done

