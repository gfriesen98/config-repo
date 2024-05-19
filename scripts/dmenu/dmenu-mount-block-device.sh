#!/bin/bash

lsblkModels=$(lsblk -o MODEL | awk 'NR>1&&NF { print $0 }' | dmenu -p "Mount Device")
modelBlockId=$(lsblk -o NAME,MODEL | grep "$lsblkModels" | awk '{ print $1}')

partitionChoice=$(lsblk -o NAME "/dev/$modelBlockId" | awk 'NR>2 { print $0 }' | sed -E -e 's/└─|├─//' | dmenu -p "Mount Partition for $lsblkModels")

mountChoice=$(ls "/mnt" | awk '{ print "/mnt/"$0 }' | dmenu -p "Mount To:")
