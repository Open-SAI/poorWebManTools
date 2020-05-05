#!/bin/bash
echo "Batch process to resize images in jpg format to upload to web root"
for imagen in $(ls *.jpg);do 
	echo Processing image $imagen, Original size[$(du -h $imagen)]
	convert $imagen -verbose -monitor -resize 50% -quality 70 $imagen
	echo ended process in $imagen, New size[$(du -h $imagen)]
	echo ------------------------------------------------------------
done
