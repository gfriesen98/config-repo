#!/bin/bash

if [ -z "$1" ]; then
	echo "input filepath not supplied"
	exit
fi

THEME_PATH=$GORTSCRIPTS_CONFIG_PATH/pdf-styling/Pandoc-Themes/drake-material.tex

pandoc "$1" --pdf-engine=xelatex -f markdown -t pdf --template=drake-material.tex | zathura -
