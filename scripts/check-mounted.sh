#!/bin/bash

if grep -qs "/mnt/$1 " /proc/mounts; then
	echo "mounted"
else
	echo "not mounted"
fi
