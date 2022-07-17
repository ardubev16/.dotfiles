#!/bin/bash

set -e

usage() {
    cat <<EOF
"Usage: $0 [-id amount]"
    -i n:   increase by n
    -d n:   decrease by n
    -m:     toggle mute
EOF
    exit 1
}

send_notification() {
    mute=$(amixer -D pulse sget Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')
    if [[ "$mute" == "off" ]]; then
        icon="audio-volume-muted-symbolic"
        volume=0
    else
        volume=$(amixer -D pulse sget Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')
        if [[ $volume -gt 0 && $volume -le 33 ]]; then
            icon="audio-volume-low-symbolic"
        elif [[ $volume -gt 33 && $volume -le 66 ]]; then
            icon="audio-volume-medium-symbolic"
        else
            icon="audio-volume-high-symbolic"
        fi
    fi
    dunstify -u low -h "string:x-dunst-stack-tag:volume" -h "int:value:$volume" -i "$icon" "Volume" "$volume%"
}

while getopts "hmi:d:" opt; do
    case $opt in
        m)
            amixer -D pulse sset Master toggle &>/dev/null
            send_notification
            exit 0
            ;;
        i)
            amixer -D pulse sset Master on &>/dev/null
            amixer -D pulse sset Master $OPTARG%+ &>/dev/null
            send_notification
            exit 0
            ;;
        d)
            amixer -D pulse sset Master on &>/dev/null
            amixer -D pulse sset Master $OPTARG%- &>/dev/null
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
