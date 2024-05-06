#!/bin/bash

i3config="$HOME/.config/i3/config"
kittyconfig="$HOME/.config/kitty/kitty.conf"
polybarconfig="$HOME/.config/polybar"
polybarscripts="$HOME/.config/polybar/scripts/*"

# full path to current kitty theme
# eventually figure out how to use this theme file for other programs
kittytheme="$HOME/.config/kitty/kitty-themes/themes/Jellybeans.conf"

# create config paths if they dont exist
#[ ! -d $i3Path ] && mkdir -p $i3Path || echo $i3Path already exists
#[ ! -d $kittyPath ] && mkdir -p $kittyPath || echo $kittyPath already exists
#[ ! -d $polybarPath ] && mkdir -p $polybarPath || echo $polybarPath already exists
#[ ! -d $polybarScriptsPath ] && mkdir -p $polybarScriptsPath || echo $polybarScriptsPath already exists

# gather configs to git repo
[ ! -d "./i3" ] && mkdir i3
[ ! -d "./kitty" ] && mkdir kitty
[ ! -d "./polybar/scripts" ] && mkdir -p ./polybar/scripts

cp $i3config ./i3/config
cp $kittyconfig ./kitty/kitty.conf
cp $kittytheme ./kitty/theme.conf
cp $polybarconfig/config.ini ./polybar/config.ini
cp $polybarconfig/launch.sh ./polybar/launch.sh
cp $polybarscripts ./polybar/scripts

# git commit
read -p "Commit Message: " commitmsg
git add .
git commit -m "$commitmsg"
git push

echo finished
