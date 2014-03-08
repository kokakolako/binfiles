#!/bin/zsh

# Variables
# ----------------------------------------------

## Get the connected devices
connected_devices=( $(xrandr | grep connected | sed /dis/d | grep -w -o "\(HDMI1\|LVDS1\|VGA1\)") )

## Store the length ot the array
arr_length=${#connected_devices[@]}

### [[Anmerkung zu dem Regex]]
### 1. Nur Zeilen, die "connected" beinhalten anzeigen (mittels grep)
### 2. Ausschneiden aller Zeilen die "dis[connected]" beinhalten (mittels sed)
### 3. Herausfiltern der verwendeten Geräte (mittels grep)

## Exceptions
ERROR_01="ERROR 01: You have only 1 monitor or you connected the\nsecond monitor not properly."
ERROR_02="ERROR 02: Choose another device as your primary monitor."

# Code
# ----------------------------------------------

dependency_check() {
    local package="$1"
    if [[ `which $package` =~ "$package not found" ]]; then
        return 1
    else
        return 0
    fi
}

if dependency_check notify-send; then
    send_message="notify-send"
else
    send_message="echo"
fi

case "$1" in

    "-S" | "--secondary") # Display screen only on secondary device
        if [[ "$arr_length" == 2 ]]; then
            xrandr --output ${connected_devices[1]} --off --output ${connected_devices[2]} --auto
        elif [[ "$arr_length" == 1 ]]; then
            $send_message $ERROR_01
            exit 1
        fi
    ;;

    "-s" | "--primary" ) # Display screen only on primary device
        if [[ $arr_length == 2 ]]; then
            xrandr --output ${connected_devices[2]} --off --output ${connected_devices[1]} --auto
        elif [[ $arr_length == 1 ]]; then
            $send_message $ERROR_01
            exit 1
        fi
    ;;

    "-i" | "--info" ) # Prompting the connected devices to stdout
        $send_message "Your connected monitors are:"
        $send_message ${connected_devices[@]}
    ;;

    "-p" | "--change-primary-to" ) # Print the primary device
        if [[ "$2" =~ \(HDMI1\|LVDS1\|VGA1\) ]]; then
            xrandr --output "$2" --primary
            $send_message "You changed your primary monitor to: $2"
        elif [[ ! "$2" =~ \(HDMI1\|LVDS1\|VGA1\) ]]; then
            $send_message $ERROR_02
            $send_message "Your connected monitors are: ${connected_devices[@]}. Choose wisely!"
            exit 1
        fi
    ;;

    "-l" | "--expand-left" ) # Expand to the right
        if [[ $arr_length == "2" ]]; then
            xrandr --output ${connected_devices[2]} --auto --left-of ${connected_devices[1]}
            $send_message "You expanded your monitor to the left side"
        elif [[ $arr_length == "1" ]]; then
            $send_message $ERROR_01
            exit 1
        fi
    ;;

    "-r" | "--expand-right" ) # Expand to the left
        if [[ $arr_length == "2" ]]; then
            xrandr --output ${connected_devices[2]} --auto --right-of ${connected_devices[1]}
            $send_message "You expanded your monitor to the right side"
        elif [[ $arr_length == "1" ]]; then
            $send_message $ERROR_01
            exit 1
        fi
    ;;

    "-a" | "--auto" ) # Choose the devices automagically
        if [[ $arr_length == 2 ]]; then
            xrandr --output ${connected_devices[2]} --off --output ${connected_devices[1]} --auto
        elif [[ $arr_length == 1 ]]; then
            exit 1
        else
            exit 1
        fi
    ;;

esac

# function _completemarks {
#    reply=($(ls $MARKPATH))
#}
#compctl -K _completemarks jump
#compctl -K _completemarks umark
# xrandr --output LVDS1 --primary --mode 1920x1080 --pos 1920x0 --output HDMI1 --mode 1920x1080 --pos 0x0
# sudo xrandr --output HDMI1 --auto --left-of LVDS1
