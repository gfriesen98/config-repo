#!/bin/bash
source $HOME/.config/gortscripts/gortrc

chosen=$(ls $NOTES_PATH | dmenu -p "Open which notes?" -i -l 10)

if [ -z "$chosen" ]; then
	echo no file selected
	notify-send "No file selected" --expire-time 800 --app-name "Notes"
	exit
fi

notify-send "Opening $chosen..." --app-name "Notes"
bash $SCRIPTS_PATH/mdtopdf-zathura.sh $NOTES_PATH/$chosen &
