#!/bin/bash
temp='/tmp/screen.png'

scrot -o $temp
convert "$temp" -filter Gaussian -thumbnail 10% -sample 1000% -blur 0x5 "$temp"
i3lock -i "$temp"
