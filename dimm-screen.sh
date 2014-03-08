max=`cat /sys/class/backlight/intel_backlight/max_brightness`
actual=`cat /sys/class/backlight/intel_backlight/brightness`

if [  $actual != $max  ]; then
    echo `expr $actual - 20` > /sys/class/backlight/intel_backlight/brightness
elif [ $actual > $max ]; then
    echo "$max" > /sys/class/backlight/intel_backlight/brightness
fi
# /sys/class/backlight/intel_backlight
