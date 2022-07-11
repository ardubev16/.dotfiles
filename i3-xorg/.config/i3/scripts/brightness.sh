#!/bin/bash

set -e

icon_path=/usr/share/icons/Papirus-Dark/64x64/apps/display-brightness.svg
notify_id=1001


usage() {
    cat <<EOF
"Usage: $0 [-id amount]"
    -i n:   increase by n
    -d n:   decrease by n
EOF
    exit 1
}

get_brightness() {
    xbacklight -get | xargs printf %3.0f
}

send_notification() {
    brightness=$(get_brightness)
    bar=$(seq -s "─" 0 $(( $brightness / 5 )) | sed 's/[0-9]//g')
    dunstify -r $notify_id -u low -i "$icon_path" "$brightness $bar"
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
