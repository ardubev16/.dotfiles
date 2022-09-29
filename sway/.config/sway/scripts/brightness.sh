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

get_brightness() {
    echo -n $(( $(brightnessctl get) * 100 / $(brightnessctl max) ))
}

inc_brightness() {
    brightnessctl set $1%+ &>/dev/null
}

dec_brightness() {
    brightnessctl set $1%- &>/dev/null
}

send_notification() {
    brightness=$(get_brightness)
    dunstify -u low -h "string:x-dunst-stack-tag:brightness" -h "int:value:$brightness" -i "display-brightness" "Brightness" "$brightness%"
}

while getopts "hi:d:" opt; do
    case $opt in
        i)
            inc_brightness $OPTARG
            send_notification
            exit 0
            ;;
        d)
            dec_brightness $OPTARG
            send_notification
            exit 0
            ;;
        h|*)
            usage
            ;;
    esac
done
if [ $OPTIND -eq 1 ]; then
    usage
fi
