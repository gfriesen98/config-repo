#!/bin/bash

notify-send "$(cal)" "Today is $(date "+%A, %B %d %Y")" --app-name "Calendar"
