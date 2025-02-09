#!/bin/bash

set -e

filename="Screenshot_$(date +"%Y-%m-%d_%H-%M-%S").png"

if [[ "$1" == "-s" ]]; then
    scrot -a "$(slop -l -t 0 -c "0.3,0.4,0.6,0.4" -f "%x,%y,%w,%h")" \
        -e 'xclip -selection clipboard -t image/png -i $f' \
        ~/Pictures/"$filename"
else
    scrot -e 'xclip -selection clipboard -t image/png -i $f' \
        ~/Pictures/"$filename"
fi

ACTION=$(dunstify -u low -A "default,Open" -i "camera-photo" "Screenshot saved" "$filename")

case $ACTION in
    "default")
        feh ~/Pictures/"$filename"
        ;;
    *)
        exit 0
        ;;
esac
