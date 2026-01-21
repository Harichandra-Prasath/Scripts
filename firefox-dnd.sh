#!/bin/bash
 
LOCKFILE="/tmp/firefox-dnd.lock"
LABEL="󰍹  SCREEN SHARING"


wmctrl -l | grep "Firefox — Sharing Indicator" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    if ! [ -f "$LOCKFILE" ]; then
        touch "$LOCKFILE"
        dunstctl set-paused true
        echo "$LABEL"     
    else
        echo "$LABEL"
    fi
else
    if [ -f "$LOCKFILE" ]; then
        rm "$LOCKFILE"
        dunstctl set-paused false
    fi
fi
