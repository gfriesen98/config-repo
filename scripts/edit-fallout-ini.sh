#!/bin/bash

falloutfolder="$HOME/.local/share/Steam/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/Documents/My Games/FalloutNV"

echo "1) Edit Fallout.ini"
echo "2) Edit FalloutPrefs.ini"
read -r -p "Select: " selection

if [[ "$selection" == "1" ]]; then
	$EDITOR "$falloutfolder/Fallout.ini"
elif [[ "$selection" == "2" ]]; then
	$EDITOR "$falloutfolder/FalloutPrefs.ini"
else
	echo "Selection $selection not supported"
fi
