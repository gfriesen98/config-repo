#!/bin/bash

selection=$(echo -e "Yes\nNo" | dmenu -p "Reboot?")

[[ $selection == "Yes" ]] && reboot
exit 0;
