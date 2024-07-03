#!/bin/bash

newvegasIniFolder="$HOME/.local/share/Steam/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/Documents/My Games/FalloutNV"

steamPrefixesDir="$HOME/.local/share/Steam/steamapps/compatdata/"
steamGamesDir="$HOME/.local/share/Steam/steamapps/common/"


gamesel=$(echo -e "1	ULTRAKILL Music Copier\n2	New Vegas INIs\n3	Cyberpunk Screenshots" | dmenu -i )

[ -z "$gamesel" ] && exit
echo $gamesel
exit

#echo "1) Edit Fallout.ini"
#echo "2) Edit FalloutPrefs.ini"
#read -r -p "Select: " selection

if [[ "$selection" == "1" ]]; then
	$EDITOR "$falloutfolder/Fallout.ini"
elif [[ "$selection" == "2" ]]; then
	$EDITOR "$falloutfolder/FalloutPrefs.ini"
else
	echo "Selection $selection not supported"
fi
