#!/bin/bash
# this script is to help me copy roms from my slow
# storage to faster ssd storage on my nas

romsPath="/mnt/gserver"
emuDir="/mnt/emulators"
targetFile=""

# copy file to path
# called when expandDir selection is considered a file
# $1 - path to selected file
function copyTo {
	copyTo=$(ls "$emuDir" | awk '{print "/mnt/emulators/"$0"/games"}' | dmenu -p "Copy to")
	[ -z $copyTo ] && exit
	
	copiedPath="$copyTo/$(basename "$1")"

	notify-send "Copying... Please Wait" "$1 👉 $copyTo" --app-name "🗒️ Copier"
	cp "$1" "$copyTo"
	notify-send "Finished Copying" "Copied to $copiedPath" --app-name "🗒️ Copier"

	notify-send "Extracting... Please Wait" "Unzipping $copiedPath" --app-name "🗒️ Copier (p7zip)"
	7z e "$copiedPath" -o"$copyTo" && rm "$copiedPath"
	notify-send "Finished Extracting" "Finished extracting $copiedPath" --app-name "🗒️ Copier (p7zip)"
}

# expand directory
# called recursively if the selection is a directory
# $1 - full path to target folder
function expandDir {
	f=$(ls -a "$1" | dmenu -p "Select rom")
	[ -z "$f" ] && exit

	[ -d "$1/$f" ] && expandDir "$1/$f"
	[ -f "$1/$f" ] && copyTo "$1/$f"
}

expandDir "$romsPath/Roms"
