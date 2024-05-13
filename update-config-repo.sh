#!/bin/bash

# i hate this script but its chill
gortscriptsrc="$HOME/.config/gortscripts/gortrc"
pandoctemplate=/usr/share/haskell-pandoc/data/templates/drake-material.tex
mybashrc="$HOME/.bashrc"
bleshrc="$HOME/.blerc"
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
nvimconfig="$HOME/.config/nvim/*"
zathuraconfig="$HOME/.config/zathura/zathurarc"

# full path to current kitty theme
# eventually figure out how to use this theme file for other programs
# themes are from dexpota/kitty-themes, placed in $HOME/.config/kitty-themes
kittytheme="$HOME/.config/kitty/kitty-themes/themes/Jellybeans.conf"

# ensure folders get created
[ ! -d "./pandoc" ] && mkdir pandoc
[ ! -d "./gortscripts" ] && mkdir gortscripts
[ ! -d "./scripts" ] && mkdir scripts
[ ! -d "./bash" ] && mkdir bash
[ ! -d "./i3" ] && mkdir i3
[ ! -d "./picom" ] && mkdir picom
[ ! -d "./kitty" ] && mkdir kitty
[ ! -d "./polybar/scripts" ] && mkdir -p ./polybar/scripts
[ ! -d "./.screenlayout" ] && mkdir .screenlayout
[ ! -d "./nvim" ] && mkdir nvim
[ ! -d "./zathura" ] && mkdir zathura

# gather configs to git repo
# copy files. copying individually to help keep repo clean of other extra shit
cp $gortscriptsrc ./gortscripts				# config file to help with various scripts
cp $pandoctemplate ./pandoc				# pandoc template theme, edited to use current noto fonts
cp -r $scripts/* ./scripts 				# collection of scripts used with the system
cp $currwallpaper ./.screenlayout/wallpaper.png		# current wallpaper
cp $screenlayout ./.screenlayout/desktop.sh		# xrandr monitor layout
cp $mybashrc ./bash/.bashrc				# bashrc
cp $bleshrc ./bash/.blerc				# ble.sh config file (bash auto complete)
cp $i3config ./i3/config				# i3 config
cp $picomconfig ./picom/picom.conf			# picom config
cp $rangerconfig ./ranger/rc.conf			# ranger config
cp $kittyconfig ./kitty/kitty.conf			# kitty terminal config
cp $kittytheme ./kitty/theme.conf			# kitty theme
cp $kittybell ./kitty/bell-custom2.oga			# kitty terminal bell sound
cp $polybarconfig/config.ini ./polybar/config.ini	# polybar bar config
cp $polybarconfig/launch.sh ./polybar/launch.sh		# polybar launch script
cp $polybarscripts ./polybar/scripts			# polybar extra scripts
cp -r $nvimconfig ./nvim					# nvim kickstart config
cp $zathuraconfig ./zathura

# git commit
read -p "Commit Message: " commitmsg
git add .
git commit -m "$commitmsg"
git push

echo finished
