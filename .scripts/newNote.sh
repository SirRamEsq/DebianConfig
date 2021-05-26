#!/bin/bash

DATE=`date +%Y-%m-%d`
filename="$DATE"
dir="$HOME/notes"
ext="md"
echo "Date $DATE"
echo "filename $filename"
echo "dir $dir"
if [ -d "$dir" ]
then
	echo "$dir found"
else
	echo "creating $dir"
	mkdir "$dir"
fi

path="$dir/$filename.$ext"
echo "PATH IS $path"
nvim "$path"
