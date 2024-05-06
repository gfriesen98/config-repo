#!/bin/bash

i3config="$HOME/.config/i3/config"
kittyconfig="$HOME/.config/kitty/kitty.conf"
polybarconfig="$HOME/.config/polybar/config.ini"
polybarScriptsPath="$polybarPath/scripts"

# full path to current kitty theme
# eventually figure out how to use this theme file for other programs
currentKittyTheme="$HOME/.config/kitty/kitty-themes/themes/Jellybeans.conf"

# create config paths if they dont exist
#[ ! -d $i3Path ] && mkdir -p $i3Path || echo $i3Path already exists
#[ ! -d $kittyPath ] && mkdir -p $kittyPath || echo $kittyPath already exists
#[ ! -d $polybarPath ] && mkdir -p $polybarPath || echo $polybarPath already exists
#[ ! -d $polybarScriptsPath ] && mkdir -p $polybarScriptsPath || echo $polybarScriptsPath already exists

# gather configs to git repo
[ ! -d "./i3" ] && mkdir i3
[ ! -d "./kitty" ] && mkdir kitty
[ ! -d "./polybar" ] && mkdir polybar
cp $i3config .
cp $kitty
