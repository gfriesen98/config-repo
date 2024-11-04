#!/bin/bash
url="https://wttr.in/Winnipeg?format=1"
output=$(curl $url 2>/dev/null)
echo $output
