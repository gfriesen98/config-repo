#!/bin/bash

mountDir=$(ls /mnt | dmenu -p "unmount")

if grep -qs "/mnt/$mountDir " /proc/mounts; then
	echo "mounted"
else
	echo "not mounted"
fi
