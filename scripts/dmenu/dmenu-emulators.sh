#!/bin/bash

# root path of your emulators folder
emuDir="/mnt/emulators"
# file path should be like this:
# ex:
# /mnt/emulators/gamecube
#			/games
#		/playstation
#			/games
#		/playstation2
#			/games
# for me this path is on my nas, so i also put /memcard /savestates in their respective folders,
# set from the configuation menu of respective emulator

# emulator names
playstationEmulator="duckstation-qt"
playstation2Emulator="pcsx2-qt"
gamecubeEmulator="dolphin-emu-nogui"

# call to launch emulator with game and push notification
# $1 - emulatorSelection, $2 - consoleSelection, $3 - gameSelection
function launchEmu {
	notify-send "Launching $3 with $1" --app-name "$1"
	$1 "$emuDir/$2/games/$3"
	exit
}

consoleSelection=$(ls "$emuDir" | dmenu -p "Console")
[ -z "$consoleSelection" ] && exit

gameSelection=$(ls "$emuDir/$consoleSelection/games" | dmenu -p "Game")
[ -z "$gameSelection" ] && exit

# check what console was selected to launch which emulator
[[ "$consoleSelection" == "playstation" ]] && launchEmu "$playstationEmulator" "$consoleSelection" "$gameSelection"
[[ "$consoleSelection" == "playstation2" ]] && launchEmu "$playstation2Emulator" "$consoleSelection" "$gameSelection"
[[ "$consoleSelection" == "gamecube" ]] && launchEmu "$gamecubeEmulator" "$consoleSelection" "$gameSelection"
