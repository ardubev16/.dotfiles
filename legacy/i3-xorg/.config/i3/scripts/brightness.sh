#!/bin/bash

set -e

usage() {
    cat <<EOF
"Usage: $0 [-id amount]"
    -i n:   increase by n
    -d n:   decrease by n
EOF
    exit 1
}

xbacklight_works() {
    [[ -n $(xbacklight) ]]
}

get_brightness() {
    if xbacklight_works; then
        xbacklight -get | xargs printf %.0f
    else
        echo -n $(( $(brightnessctl get) * 100 / $(brightnessctl max) ))
    fi
}

inc_brightness() {
    if xbacklight_works; then
        xbacklight -inc "$1"
    else
        brightnessctl set "$1"%+ &>/dev/null
    fi
}

dec_brightness() {
    if xbacklight_works; then
        xbacklight -dec "$1"
    else
        brightnessctl set "$1"%- &>/dev/null
    fi
}

send_notification() {
    brightness=$(get_brightness)
    dunstify -u low -h "string:x-dunst-stack-tag:brightness" -h "int:value:$brightness" -i "display-brightness" "Brightness" "$brightness%"
}

while getopts "hi:d:" opt; do
    case $opt in
        i)
            inc_brightness "$OPTARG"
            send_notification
            exit 0
            ;;
        d)
            dec_brightness "$OPTARG"
            send_notification
            exit 0
            ;;
        h|*)
            usage
            ;;
    esac
done
if [ "$OPTIND" -eq 1 ]; then
    usage
fi
