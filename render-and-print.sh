#!/bin/bash

# render latex
for latex in *.tex; do
	echo "Rendering $latex"
	xelatex -interaction=nonstopmode "$latex"
done

#print
for pdf in *.pdf; do
echo "Printing $pdf"
	lp "$pdf"
done

echo "Done with all, have a great day :)"