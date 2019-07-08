#!/bin/bash

TARGET=$1

if [[ -z $TARGET ]]; then
	TARGET="./"
fi

if [[ -d $TARGET ]]; then
	# render latex
	for latex in *.tex; do
		echo "Rendering $latex"
		xelatex -interaction=nonstopmode "$latex"
	done
	# print
	for pdf in *.pdf; do
	echo "Printing $pdf"
		lp "$pdf"
	done
elif [[ -f $TARGET ]]; then
	echo "Rendering $latex"
	xelatex -interaction=nonstopmode "$latex"
	lp "$(basename $TARGET).pdf"
fi

echo "Done with all, have a great day :)"