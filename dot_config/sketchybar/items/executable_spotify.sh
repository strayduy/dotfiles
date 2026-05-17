#!/bin/sh

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_playback_change $SPOTIFY_EVENT \
           --add item spotify right \
           --set spotify label.color=$ACCENT_COLOR \
                         label.max_chars=32 \
                         scroll_texts=on \
                         icon=♪ \
                         icon.color=$ACCENT_COLOR \
                         background.padding_right=16 \
                         background.drawing=off \
                         script="$PLUGIN_DIR/spotify.sh" \
           --subscribe spotify spotify_playback_change
