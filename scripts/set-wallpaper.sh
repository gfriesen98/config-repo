#!/bin/bash

papePath=$HOME/.screenlayout/wallpaper.png

set_wallpaper() {
	feh --bg-scale $papePath
	exit 0
}

set_new_wallpaper() {
	convert "$1" $papePath
	feh --bg-scale $papePath
}

while getopts ":hsi:" flag; do
	case "${flag}" in
		s) set_wallpaper ;;
		i) set_new_wallpaper "${OPTARG}" ;;
		h | *)
			echo help meee
			exit 0
			;;
	esac
done
