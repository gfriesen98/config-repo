#!/bin/bash
removable_drives=""
for _device in /sys/block/*/dev; do
	if echo $(readlink -f "$_device")|grep -q "usb"; then
		_disk=$(echo "$_device" | cut -f4 -d/)
		removeable_drives="$removable_drives $_disk"
	fi
done

echo $removable_drives

