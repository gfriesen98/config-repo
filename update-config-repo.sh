#!/bin/bash

mybashrc="$HOME/.bashrc"
scripts="$HOME/scripts"
i3config="$HOME/.config/i3/config"
kittyconfig="$HOME/.config/kitty/kitty.conf"
polybarconfig="$HOME/.config/polybar"
polybarscripts="$HOME/.config/polybar/scripts/*"

# full path to current kitty theme
# eventually figure out how to use this theme file for other programs
# themes are from dexpota/kitty-themes, placed in $HOME/.config/kitty-themes
kittytheme="$HOME/.config/kitty/kitty-themes/themes/Jellybeans.conf"

# gather configs to git repo
[ ! -d "./scripts" ] && mkdir scripts
[ ! -d "./bash" ] && mkdir bash
[ ! -d "./i3" ] && mkdir i3
[ ! -d "./kitty" ] && mkdir kitty
[ ! -d "./polybar/scripts" ] && mkdir -p ./polybar/scripts

# copy files. copying individually to help keep repo clean of other extra shit
cp $scripts/* ./scripts 				# collection of scripts used with the system
cp $mybashrc ./bash/.bashrc				# bashrc
cp $i3config ./i3/config				# i3 config
cp $kittyconfig ./kitty/kitty.conf			# kitty terminal config
cp $kittytheme ./kitty/theme.conf			# kitty theme
cp $polybarconfig/config.ini ./polybar/config.ini	# polybar bar config
cp $polybarconfig/launch.sh ./polybar/launch.sh		# polybar launch script
cp $polybarscripts ./polybar/scripts			# polybar extra scripts

# git commit
read -p "Commit Message: " commitmsg
git add .
git commit -m "$commitmsg"
git push

echo finished
