#!/bin/sh

SPACE_SIDS=(1 2 3 S C N M)

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    for SID in "${SPACE_SIDS[@]}"; do
        APPS=$(aerospace list-windows --workspace "$SID" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

        ICON_STRIP=" "
        if [ "${APPS}" != "" ]; then
            while read -r APP; do
                ICON_STRIP+=" $($CONFIG_DIR/plugins/icon_map.sh "$APP")"
            done <<< "$APPS"
        else
            ICON_STRIP=" —"
        fi

        sketchybar --set space.$SID label="$ICON_STRIP"
    done
fi
