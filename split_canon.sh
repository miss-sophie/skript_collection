#!/bin/bash

TARGET=$1

if [[ -z $TARGET ]]; then
	TARGET='./'
	echo "No directory provided. Using root directory."
elif [[ ! -d $TARGET ]]; then
	echo "Not a valid directory. Exiting."
	exit 1
else
	echo "Found valid directory. Using $TARGET"
fi

cd $TARGET
mkdir $TARGET/raw
find *.CR2 -print0 | xargs -0 mv -t ./raw/
exit 0
