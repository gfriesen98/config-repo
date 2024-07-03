#!/bin/bash

monitor="DisplayPort-1"
mode="1920x1080"
hz="165"

scale=$(dmenu -p "Enter Res:" < /dev/null)
[ -z "$scale" ] && exit

singleOnly=$(echo -e "Yes\nNo" | dmenu -p "Turn off other monitors?")
[ -z "$singleOnly" ] && exit

if [[ $singleOnly == "Yes" ]]; then
	xrandr --output $monitor --mode $mode --scale-from $scale -r $hz \
		--output DisplayPort-2 --off --output HDMI-A-0 --off
	exit
else
	xrandr --output $monitor --mode $mode --scale-from $scale -r $hz
	exit
fi

