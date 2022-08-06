#!/bin/bash

set -e

usage() {
    cat <<EOF
"Usage: $0 [-id amount]"
    -m:     operates on microphone volume
    -i n:   increase by n
    -d n:   decrease by n
    -t:     toggle mute
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
        if [[ $volume -le 33 ]]; then
            icon="audio-volume-low-symbolic"
        elif [[ $volume -gt 33 && $volume -le 66 ]]; then
            icon="audio-volume-medium-symbolic"
        else
            icon="audio-volume-high-symbolic"
        fi
    fi
    dunstify -u low -h "string:x-dunst-stack-tag:volume" -h "int:value:$volume" -i "$icon" "Volume" "$volume%"
}

inc_volume() {
    if [[ $microphone ]]; then
        pactl set-source-mute 0 false
        pactl set-source-volume 0 +$1%
    else
        pactl set-sink-mute 0 false
        pactl set-sink-volume 0 +$1%
        send_notification
    fi
    exit 0
}

dec_volume() {
    if [[ $microphone ]]; then
        pactl set-source-mute 0 false
        pactl set-source-volume 0 -$1%
    else
        pactl set-sink-mute 0 false
        pactl set-sink-volume 0 -$1%
        send_notification
    fi
    exit 0
}

toggle_mute() {
    if [[ $microphone ]]; then
        pactl set-source-mute 0 toggle
    else
        pactl set-sink-mute 0 toggle
        send_notification
    fi
    exit 0
}

while getopts "hmti:d:" opt; do
    case $opt in
        m)
            microphone=true
            ;;
        t)
            toggle_mute
            ;;
        i)
            inc_volume $OPTARG
            ;;
        d)
            dec_volume $OPTARG
            ;;
        h|*)
            usage
            ;;
    esac
done
if [ $OPTIND -eq 1 ]; then
    usage
fi
