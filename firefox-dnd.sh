#!/bin/bash
 
DUNST_TIMEOUT=3     # duration in seconds
DUNST_URGENCY=low   # low, normal or critical

LOCKFILE="/tmp/firefox-dnd.lock"

wmctrl -l | grep "Firefox — Sharing Indicator" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    if ! [ -f "$LOCKFILE" ]; then
        touch "$LOCKFILE"
        notify-send -u ${DUNST_URGENCY} -t ${DUNST_TIMEOUT}000 "DND enabled" "Sharing Sharing Started"
        sleep ${DUNST_TIMEOUT}
        dunstctl set-paused true
    fi
else
    if [ -f "$LOCKFILE" ]; then
        rm "$LOCKFILE"
        notify-send "DND disabled" "Screen Sharing Ended"
        dunstctl set-paused false
    fi
fi
