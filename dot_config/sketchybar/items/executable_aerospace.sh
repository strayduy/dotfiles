#!/bin/sh

SPACE_SIDS=(1 2 3 S C N M)

sketchybar --add event aerospace_workspace_change

for SID in "${SPACE_SIDS[@]}"; do
    sketchybar --add item space.$SID left \
               --set space.$SID icon=$SID \
                                label.font="sketchybar-app-font:Regular:16.0" \
                                label.padding_right=20 \
                                click_script="aerospace workspace $SID" \
                                script="$CONFIG_DIR/plugins/aerospace.sh $SID" \
               --subscribe space.$SID aerospace_workspace_change
done

sketchybar --add item workspace_apps left \
           --set workspace_apps icon="❯" \
                          icon.color=$ACCENT_COLOR \
                          icon.padding_left=4 \
                          label.drawing=off \
                          background.drawing=off \
                          script="$CONFIG_DIR/plugins/workspace_apps.sh" \
           --subscribe workspace_apps aerospace_workspace_change
