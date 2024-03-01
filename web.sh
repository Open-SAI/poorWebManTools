#!/bin/bash

# replace main parameters
IMG_FORMAT=jpeg # what type of image do you convert to web size?
IMG_COUNTER=12 # if is not equal to zero, the new images will be incrementally named 1.jpg, 2.jpg... etc
IMG_SIZE=1600x1200 # size in pixels of the new image
IMG_QUALITY=70 # quality percentage of the new image vs. the original
CLEAN_FILE_NAMES=1 # use to clean file name with spaces


clear
echo "Batch process to resize images in jpg format to upload to web root"

if [[ $CLEAN_FILE_NAMES != 0 ]]; then
	detox -v .
fi

for imagen in $(ls *.$IMG_FORMAT);do 
	echo Processing image $imagen, Original size[$(du -h $imagen)]
	if [[ $IMG_COUNTER == 0 ]]; then
		convert $imagen -verbose -monitor -resize $IMG_SIZE -quality $IMG_QUALITY $imagen
		echo ended process in $imagen, New size[$(du -h $imagen)]
		echo ------------------------------------------------------------
	else
		convert $imagen -verbose -monitor -resize $IMG_SIZE -quality $IMG_QUALITY $IMG_COUNTER.$IMG_FORMAT
		echo ended process in $IMG_FORMAT.$IMG_COUNTER, New size[$(du -h $IMG_COUNTER.$IMG_FORMAT)]
		echo ------------------------------------------------------------
		let IMG_COUNTER++
	fi
done
