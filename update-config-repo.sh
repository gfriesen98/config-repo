#!/bin/bash

mybashrc="$HOME/.bashrc"
scripts="$HOME/scripts"
currwallpaper="$HOME/.screenlayout/wallpaper.png"
screenlayout="$HOME/.screenlayout/desktop.sh"
i3config="$HOME/.config/i3/config"
picomconfig="$HOME/.config/picom/picom.conf"
rangerconfig="$HOME/.config/ranger/rc.conf"
kittyconfig="$HOME/.config/kitty/kitty.conf"
kittybell="$HOME/.config/kitty/bell-custom2.oga"
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
[ ! -d "./picom" ] && mkdir picom
[ ! -d "./kitty" ] && mkdir kitty
[ ! -d "./polybar/scripts" ] && mkdir -p ./polybar/scripts
[ ! -d "./.screenlayout" ] && mkdir .screenlayout

# copy files. copying individually to help keep repo clean of other extra shit
cp $scripts/* ./scripts 				# collection of scripts used with the system
cp $currwallpaper ./.screenlayout/wallpaper.png		# current wallpaper
cp $screenlayout ./.screenlayout/desktop.sh		# xrandr monitor layout
cp $mybashrc ./bash/.bashrc				# bashrc
cp $i3config ./i3/config				# i3 config
cp $picomconfig ./picom/picom.conf			# picom config
cp $rangerconfig ./ranger/rc.conf			# ranger config
cp $kittyconfig ./kitty/kitty.conf			# kitty terminal config
cp $kittytheme ./kitty/theme.conf			# kitty theme
cp $kittybell ./kitty/bell-custom2.oga			# kitty terminal bell sound
cp $polybarconfig/config.ini ./polybar/config.ini	# polybar bar config
cp $polybarconfig/launch.sh ./polybar/launch.sh		# polybar launch script
cp $polybarscripts ./polybar/scripts			# polybar extra scripts

# git commit
read -p "Commit Message: " commitmsg
git add .
git commit -m "$commitmsg"
git push

echo finished
