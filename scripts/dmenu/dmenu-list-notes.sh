#!/bin/bash

source $HOME/.config/gortscripts/gortrc

chosen=$(ls $NOTES_PATH | dmenu -p "Open Notes")
[ -z "$chosen" ] && exit

openType=$(echo -e "View\nEdit" | dmenu -p "Open Notes" -l 0)
[ -z "$openType" ] && exit

if [[ "$openType" == "Edit" ]]; then
	notify-send "Opening $chosen in $EDITOR" --app-name "Notes"
	$TERMINAL $EDITOR $NOTES_PATH/$chosen
else
	notify-send "Opening $chosen in $PDF_VIEWER" --app-name "Notes"
	bash $SCRIPTS_PATH/mdtopdf-zathura.sh $NOTES_PATH/$chosen &
fi
