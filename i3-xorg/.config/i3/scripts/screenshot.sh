#!/bin/bash

set -e

scrot ~/Pictures/Screenshot_%Y-%m-%d_%H-%M-%S.png \
    -e 'xclip -selection clipboard -t image/png -i $f'

notify-send "Saved as Screenshot_$(date +"%Y-%m-%d_%H-%M-%S").png"
