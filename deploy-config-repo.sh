#!/bin/bash

# i also hate this script but its chill

gortscriptsrc="$HOME/.config/gortscripts/gortrc"
emojis="$HOME/.config/gortscripts/emojis"
pandoctemplate=/usr/share/haskell-pandoc/data/templates/drake-material.tex
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
nvimconfig="$HOME/.config/nvim/*"
zathuraconfig="$HOME/.config/zathura/zathurarc"
dunstconfig="$HOME/.config/dunst/dunstrc"
sxivconfig="$HOME/.config/sxiv/exec/key-handler"
xorgxresources="$HOME/.Xresources"
# gtk shit. using lxappearance to change themes
gtkthemedir="$HOME/.themes/*"
iconsets="$HOME/.icons/*"

# full path to current kitty theme
# eventually figure out how to use this theme file for other programs
# themes are from dexpota/kitty-themes, placed in $HOME/.config/kitty-themes
kittytheme="$HOME/.config/kitty/kitty-themes/themes/Jellybeans.conf"

# copy stuff to their new proper homes
[[ ! -d "$(dirname $gortscriptsrc)" ]] && mkdir -p $(dirname $gortscriptsrc)
cp "./gortscripts/gortrc" "$gortscriptsrc" && cp "./gortscripts/emojis" "$emojis" && echo "Copied ./gortscripts"

[[ ! -d "$(dirname $pandoctemplate)" ]] && mkdir -p $(dirname $pandoctemplate)
cp "./pandoc/drake-material.tex" "$pandoctemplate" && echo "Copied pandoc styles"

[[ ! -d "$(dirname $scripts)" ]] && mkdir -p "$(dirname $scripts)/dmenu"
cp "./scripts/*" "$scripts" && echo "Copied scripts"

[[ ! -d "$(dirname $currwallpaper)" ]] && mkdir -p $(dirname $currwallpaper)
cp "./.screenlayout/*" "~/.screenlayout/" && echo "Copied .screenlayout"

[[ ! -d "$(dirname $i3config)" ]] && mkdir -p $(dirname $i3config)
cp "./i3/config" "~/.config/i3" && echo "Copied i3 config"

[[ ! -d "$(dirname $picomconfig)" ]] && mkdir -p $(dirname $picomconfig)
cp "./picom/picom.conf" "$picomconfig" && echo "Copied picom config"

[[ ! -d "$(dirname $rangerconfig)" ]] && mkdir -p $(dirname $rangerconfig)
cp "./ranger/rc.conf" "$rangerconfig" && echo "Copied ranger rc"

[[ ! -d "$(dirname $kittyconfig)" ]] && mkdir -p "~/.config/kitty/theme"
cp "./kitty/kitty.conf" "$kittyconfig" && cp "./kitty/bell-custom2.oga" "$kittybell" && cp "./kitty/theme.conf" "$kittytheme" && echo "Copied kitty configs"

[[ ! -d "~/.config/polybar" ]] && mkdir -p "~/.config/polybar/scripts"
cp "./polybar/launch.sh" "~/.config/polybar/launch.sh" && cp "./polybar/config.ini" "~/.config/polybar/config.ini" && cp "./polybar/scripts/*" "~/.config/polybar/scripts" && echo "Copied polybar configs"

[[ ! -d "~/.config/nvim" ]] && mkdir -p "~/.config/nvim/lua"
cp "./nvim/*" "~/.config/nvim" && echo "Copied neovim configs"

[[ ! -d "~/suckless/dmenu" ]] && mkdir -p "~/suckless/dmenu"
cp "./suckless/*" "~/suckless/dmenu" && echo "Copied suckless (dmenu). Need to copy dmenu_run to /usr/local/bin/dmenu_run!!"

[[ ~ -d "~/.config/sxiv/exec/key-handler" ]] && mkdir -p "~/.config/sxiv/exec/key-handler"
cp "./sxiv/*" "~/.config/sxiv/exec/key-handler" && echo "Copied sxiv key handler"

[[ ! -d "~/.themes" ]] && mkdir -p "~/.themes"
cp "./themes/*" "~/.themes" && echo "Copied themes. Themes need to be unzipped first!!"

[[ ! -d "~/.icons" ]] && mkdir -p "~/.icons"
cp "./icons/*" && echo "Copied icons. Icons need to be unzipped first!!"

cp "./bash/.bashrc" "~/.bashrc" && cp "./bash/.bash_profile" "~/.bash_profile" && echo "Copied .bashrc and profile"

cp "./Xorg/.xinitrc" "~/.xinitrc" && cp "./Xorg/.Xresources" "~/.Xresources" && echo "Copied .xinitrc and resources"

cp "./gtk2/.gtkrc-2.0" "~/.gtkrc-2.0" && echo "Copied .gtkrc-2.0"

echo done!
