#!/usr/bin/env sh

chosen=$(cut -d ';' -f1 ./emoji-list | dmenu -i -l 10 | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." --expire-time 2000 &
fi
