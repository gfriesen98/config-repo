#!/bin/bash

source $HOME/.config/gortscripts/gortrc

name=$(dmenu -p "New Note:" < /dev/null)
[ -z "$name" ] && exit

filepath="$NOTES_PATH/$name.md"
touch $filepath

$EDITOR $filepath
