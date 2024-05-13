#!/bin/bash
source $HOME/.config/gortscripts/gortrc

if [ -z "$NOTES_PATH" ]; then
	echo \$NOTES_PATH is not found. Is \$HOME/.config/gortscripts/gortrc sourced in .bashrc?
	exit
fi

chosen=$(ls $NOTES_PATH | dmenu -p "Open which notes?" -i -l 10)
bash $SCRIPTS_PATH/mdtopdf-zathura.sh $NOTES_PATH/$chosen &
