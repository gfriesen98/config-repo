#!/bin/bash

prompt=$(awk '{ print $1 }' $HOME/.config/freerdp-hosts | dmenu -p "freerdp")

username=$(cat $HOME/.config/freerdp-hosts | grep "$prompt" | awk '{ print $3 }' $HOME/.config/freerdp-hosts)
echo $username

hostIp=$(awk '{ print $1 }' $HOME/.config/freerdp-hosts | grep "$prompt")
echo $hostIp

