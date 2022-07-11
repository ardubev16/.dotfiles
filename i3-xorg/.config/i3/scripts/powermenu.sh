#!/bin/bash

set -e

# Options for powermenu
lock=" Lock"
logout=" Logout"
sleep="鈴 Sleep"
reboot=" Reboot"
shutdown=" Shutdown"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu -config "~/.config/rofi/powermenu.rasi" )

# Do something based on selected option
case "$selected_option" in
    "$lock")
        loginctl lock-session
        ;;
    "$logout")
        i3-msg exit
        ;;
    "$sleep")
        systemctl suspend
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
    *)
        echo "No match"
        exit 1
esac
