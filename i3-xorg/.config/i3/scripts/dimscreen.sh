#!/bin/bash

set -e

## CONFIGURATION ##############################################################

# Brightness will be lowered to this value.
min_brightness=0

# Set time and steps for fading to $min_brightness here.
# Setting steps to 1 disables fading.
fade_time=200
fade_steps=20
fade_step_time=$(printf 0.%03d $(( $fade_time / $fade_steps )))

# If you have a driver without RandR backlight property (e.g. radeon),
# brightnessctl will be used

###############################################################################

xbacklight_works() {
    [[ ! -z $(xbacklight) ]]
}

get_brightness() {
    if xbacklight_works; then
        xbacklight -get | xargs printf %.0f
    else
        echo -n $(( $(brightnessctl get) * 100 / $(brightnessctl max) ))
    fi
}

set_brightness() {
    if xbacklight_works; then
        xbacklight -set $1
    else
        brightnessctl set $1% &>/dev/null
    fi
}

fade_brightness() {
    if xbacklight_works; then
        xbacklight -time $fade_time -steps $fade_steps -set $1
    else
        if [[ $brightness -le $fade_steps ]]; then
            brightness_step=-1
        else
            brightness_step=$(( - ($brightness - $1) / $fade_steps ))
        fi
        for curr_brightness in $(seq $brightness $brightness_step $1); do
            set_brightness $curr_brightness
            sleep $fade_step_time
        done
        set_brightness $1
    fi
}

brightness=$(get_brightness)

trap 'exit 0' TERM INT
trap "set_brightness $brightness; kill %%" EXIT
fade_brightness $min_brightness
sleep 2147483647 &
wait
