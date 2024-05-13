#!/bin/bash

killall dunst
/usr/bin/dunst &
notify-send "✔️ Started Dunst"
