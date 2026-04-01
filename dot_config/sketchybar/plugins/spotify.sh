#!/bin/sh

STATE="$(echo "$INFO" | jq -r '.["Player State"]')"
if [ "$STATE" = "Playing" ]; then
    TRACK="$(echo "$INFO" | jq -r .Name)"
    ARTIST="$(echo "$INFO" | jq -r .Artist)"
    sketchybar --set "$NAME" label="$TRACK - $ARTIST" drawing=on
else
    sketchybar --set $NAME drawing=off
fi
