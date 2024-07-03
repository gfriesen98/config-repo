#!/bin/bash
hostsPath="$HOME/.config/freerdp-hosts"

prompt=$(awk '{ print $1" "$2" "$3 }' $hostsPath | dmenu -p "freerdp")
[ -z "$prompt" ] && exit

username=$(grep "$prompt" $hostsPath | awk '{ print $3 }')
hostIp=$(grep "$prompt" $hostsPath | awk '{ print $1 }')

password=$(dmenu -p "Enter password:" < /dev/null)
[ -z "$password" ] && exit

notify-send "Connecting..." "$username@$hostIp" --app-name "FreeRDP"

kitty flatpak run com.freerdp.FreeRDP /u:$username /p:$password /v:$hostIp +clipboard /network:auto /rfx /gfx:rfx /floatbar:sticky:off,default:visible,show:always +fonts /bpp:32 /audio-mode:0 +aero +window-drag /size:1280x720 /tune:FreeRDP_HiDefRemoteApp:true,FreeRDP_GfxAVC444v2:true,FreeRDP_GfxH264:true
