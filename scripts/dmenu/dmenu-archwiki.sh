#!/bin/bash

# search the arch wiki

query=$(dmenu -p "Archwiki search:" < /dev/null)
[ -z "$query" ] && exit

firefox "https://wiki.archlinux.org/index.php?search=$query&title=Special:Search&wprov=arcw1_-1"
