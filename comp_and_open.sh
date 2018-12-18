#!/bin/sh
if [ "$#" -gt "0" ]; then 
	TEX_NAME="$1.tex"
	pdflatex -halt-on-error "$TEX_NAME"
	if [ $? = 0 ] ; then #$? gets error code from last command
	  osascript -e 'quit app "Preview"'
	  echo "Compilation worked!"
	  PDF_NAME="$1.pdf"
	  open "/Applications/Preview.app/" "$PDF_NAME"
	else 
	 echo "LaTeXing failed"  
	fi
else
	echo "Insufficient paramaters"
fi