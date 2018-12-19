#!/bin/sh
if [ $? = 0 ] ; then
	if [ "$#" -gt "0" ]; then 
		pdflatex -halt-on-error "$1.tex"
		if [ $? != 0 ] ; then #$? gets error code from last command
		  echo "LateXing failed!"
		else 
		 echo "LaTeXing worked  
		fi
	else
		echo "Insufficient paramaters"
	fi
else 
	echo "pull failed"
fi