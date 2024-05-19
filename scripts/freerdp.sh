#!/bin/bash
read -p "Host: " host
read -p "Enter username: " username
read -p "Enter password: " password

flatpak run com.freerdp.FreeRDP /u:$username /p:$password /v:$host +clipboard /network:auto /rfx /gfx:rfx /floatbar:sticky:off,default:visible,show:always +fonts /bpp:32 /audio-mode:0 +aero +window-drag /size:1280x720 /tune:FreeRDP_HiDefRemoteApp:true,FreeRDP_GfxAVC444v2:true,FreeRDP_GfxH264:true
