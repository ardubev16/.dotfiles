#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait for bar instances to terminate
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Laung the bars
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
