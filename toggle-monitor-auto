#!/bin/sh

hdmi_state=`xrandr --query | grep "HDMI1"`
lvds1_state=`xrandr --query | grep "LVDS1"`

if [ -n "$hdmi_state" ]; then
    xrandr --output LVDS1 --off --output HDMI1 --auto
elif [ -z "$hdmi_state" ]; then
    xrandr --output HDMI1 --off --output LVDS1 --auto
else
    print "ERROR: Can't detect another monitor"
fi

