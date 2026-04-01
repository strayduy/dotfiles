#!/bin/sh

sketchybar --add item clock right \
           --set clock update_freq=1 icon=  script="$PLUGIN_DIR/clock.sh"
