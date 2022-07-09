#!/usr/bin/env bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot -z $PICTURE"

BLUR="0x8"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE
rm $PICTURE
