#!/bin/bash

imagesPath="/mnt/gserver/Images/2024-wg-scrape"
folderChoice=$(ls $imagesPath | dmenu -p "Images")
[ -z "$folderChoice" ] && exit

notify-send "Opening $imagesPath/$folderChoice" --app-name "sxiv"
sxiv -t "$imagesPath/$folderChoice"
