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

send_notification() {
    brightness=$(xbacklight -get | xargs printf %.0f)
    dunstify -u low -h "string:x-dunst-stack-tag:brightness" -h "int:value:$brightness" -i "display-brightness" "Brightness" "$brightness%"
}

while getopts "hi:d:" opt; do
    case $opt in
        i)
            xbacklight -inc $OPTARG
            send_notification
            exit 0
            ;;
        d)
            xbacklight -dec $OPTARG
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
