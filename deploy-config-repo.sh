#!/bin/bash

# i also hate this script but its chill

screenlayoutPath="$HOME/.screenlayout"
scriptsPath="$HOME/scripts"
i3Path="$HOME/.config/i3"
kittyPath="$HOME/.config/kitty"
picomPath="$HOME/.config/picom"
polybarPath="$HOME/.config/polybar"
rangerPath="$HOME/.config/ranger"
nvimPath="$HOME/.config/nvim"
gortscriptsPath="$HOME/.config/gortscripts"

# copy stuff to their new proper homes

cp ./.screenlayout/* $screenlayoutPath
cp -r ./scripts/* $scriptsPath
cp ./i3/* $i3Path
cp ./kitty/* $kittyPath
cp ./picom/* $picomPath
cp -r ./polybar/* $polybarPath
cp -r ./nvim/* $nvimPath
cp ./ranger/* $rangerPath
cp ./gortscripts $gortscriptsPath

echo done!
