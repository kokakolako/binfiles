#!/bin/sh

touchpad_state=`synclient -l | grep TouchpadOff | awk '{print $3}'` 

if [ $touchpad_state == 0 ]; then
    synclient TouchpadOff=1
    notify-send "Das Touchpad ist deaktiviert"
elif [ $touchpad_state == 1 ]; then
    synclient TouchpadOff=0
    notify-send "Das Touchpad ist aktiviert"
else
    print "ERROR: Can't detect the TouchpadOff status!"
fi

