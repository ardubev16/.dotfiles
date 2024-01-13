#!/usr/bin/env bash

# keys speed
dconf write /org/gnome/desktop/peripherals/keyboard/delay "uint32 250"
## 20 is the milliseconds delay, it equals to 50 keys per second
dconf write /org/gnome/desktop/peripherals/keyboard/repeat-interval "uint32 20"

dconf write /org/gnome/desktop/sound/allow-volume-above-100-percent true
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature "uint32 3700"
dconf write /org/gnome/mutter/edge-tiling false