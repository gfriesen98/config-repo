#!/bin/bash

url="http://wttr.in/Winnipeg"
img="/tmp/weather.png"

phantomjs $HOME/scripts/phantomjs/examples/rasterize.js $url $img 
convert $img -crop 200x140+0+0 -transparent black /tmp/weather_edited.png 2>/dev/null
