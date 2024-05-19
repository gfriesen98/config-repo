#!/bin/bash

emuDir="/mnt/emulators"

playstationEmulator="duckstation-qt"
playstation2Emulator="pcsx2-qt"

consoleSelection=$(ls "$emuDir" | dmenu -p "Console")
echo $consoleSelection

gameSelection=$(ls "$emuDir/$consoleSelection/games" | dmenu -p "Game")
echo $gameSelection

if [[ $consoleSelection == "playstation" ]]; then
	notify-send "Launching $gameSelection with $playstationEmulator" --app-name "Emulators"
	$playstationEmulator "$emuDir/$consoleSelection/games/$gameSelection"

elif [[ $consoleSelection == "playstation2" ]]; then
	notify-send "Launching $gameSelection with $playstation2Emulator" --app-name "Emulators"
	$playstation2Emulator "$emuDir/$consoleSelection/games/$gameSelection"
else
	notify-send "Not Implemented"
fi
