#!/bin/bash

killall -q polybar

polybar -q main 2>&1 | tee -a /tmp/polybar.log & disown
