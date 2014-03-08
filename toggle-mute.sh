#!/bin/sh
if [[ `cat ~/bin/mute-status` -eq "muted" ]]; then
    echo "unmuted" > "~/bin/mute-status"
fi
if [[ `cat ~/bin/mute-status` -eq "unmuted" ]]; then
    echo "muted" > "~/bin/mute-status"
fi
ncmpcpp toggle
toggle=$((pactl list sinks | grep -q Mute:.no && echo 1) || echo 0)
pactl set-sink-mute 0 $toggle
