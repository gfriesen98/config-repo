#!/bin/bash

timeEmojis="$HOME/.config/polybar/scripts/timeStringTable"
currTime=$(date +%r)
currHours=$(echo "$currTime" | awk -F ':' '{print $1}')
currMinutes=$(echo "$currTime" | awk -F ':' '{print $2}')
currSeconds=$(echo "$currTime" | awk -F ':' '{print $3}')
currAMPM=$(echo "$currTime" | awk -F ' ' '{print $2}')

if [ "$currMinutes" -lt "30" ]; then
    timeEmoji=$(grep "$currHours 00" $timeEmojis | awk -F ' ' '{print $3}')
else
    timeEmoji=$(grep "$currHours 30" $timeEmojis | awk -F ' ' '{print $3}')
fi

echo "$timeEmoji $currHours:$currMinutes:$currSeconds"
