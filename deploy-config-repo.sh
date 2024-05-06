#!/bin/bash

scripts="$HOME/scripts"
i3="$HOME/.config/i3"
kitty="$HOME/.config/kitty"
polybarscripts="$HOME/.config/polybar/scripts"
polybar="$HOME/.config/polybar"

# create config paths if they dont exist
[ ! -d $scripts ] && mkdir -p $scripts || echo $scripts already exists
[ ! -d $i3 ] && mkdir -p $i3 || echo $i3 already exists
[ ! -d $kitty ] && mkdir -p $kitty || echo $kitty already exists
[ ! -d $polybar ] && mkdir -p $polybar || echo $polybar already exists
[ ! -d $polybarscripts ] && mkdir -p $polybarscripts || echo $polybarscripts already exists

echo copying dotfiles
cp ./scripts/* $scripts
cp ./bash/.bashrc $HOME/.bashrc
cp ./i3/* $i3
cp ./kitty/* $kitty
cp ./polybar/* $polybar

echo finished
