#!/bin/bash

# i also hate this script but its chill

screenlayoutPath="$HOME/.screenlayout"
scriptsPath="$HOME/scripts"
i3Path="$HOME/.config/i3"
kittyPath="$HOME/.config/kitty"
picomPath="$HOME/.config/picom"
polybarPath="$HOME/.config/polybar"
rangerPath="$HOME/.config/ranger"

# copy stuff to their new proper homes

cp ./.screenlayout/* $screenlayoutPath
cp ./scripts/* $scriptsPath
cp ./i3/* $i3Path
cp ./kitty/* $kittyPath
cp ./picom/* $picomPath
cp ./polybar/* $polybarPath
cp ./ranger/* $rangerPath

echo done!
