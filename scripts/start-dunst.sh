#!/bin/bash

killall dunst
/usr/bin/dunst -verbosity crit &
notify-send "✔️ Started Dunst"
