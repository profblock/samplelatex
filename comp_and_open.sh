#!/bin/sh
#git pull
if [ $? = 0 ] ; then
	if [ "$#" -gt "0" ]; then 
		TEX_NAME="$1.tex"
		echo "$TEX_NAME"
		pdflatex -halt-on-error "$TEX_NAME"
		if [ $? = 0 ] ; then #$? gets error code from last command
		  osascript -e 'quit app "Preview"'
		  echo "Compilation worked!"
		  PDF_NAME="$1.pdf"
		  open "/Applications/Preview.app/" "$PDF_NAME"
		  git commit -a --allow-empty-message -m ''
		  if [ $? = 0 ] ; then
			  git push 
		  fi
		else 
		 echo "LaTeXing failed"  
		fi
	else
		echo "Insufficient paramaters"
	fi
else 
	echo "pull failed"
fi