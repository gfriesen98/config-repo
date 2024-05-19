#!/usr/bin/env sh

chosen=$(cat $GORTSCRIPTS_CONFIG_PATH/emojis | dmenu -p "Emojis")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	emoji=$(echo "$chosen" | tr -d '\n' | awk -F ' ' '{print $1}')
	echo "$emoji" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$emoji' copied to clipboard." --expire-time 3000 --app-name "Emoji Picker" &
fi
