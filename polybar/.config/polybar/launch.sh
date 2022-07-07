#!/usr/bin/env bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c $XDG_CONFIG_HOME/polybar/config.ini &
# polybar -q main2 -c $XDG_CONFIG_HOME/polybar/config.ini &
