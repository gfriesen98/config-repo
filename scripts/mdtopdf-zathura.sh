#!/bin/bash

if [ -z "$1" ]; then
	echo "input filepath not supplied"
	exit
fi

pandoc "$1" --pdf-engine=xelatex -f markdown -t pdf --template=drake-material.tex | zathura -
