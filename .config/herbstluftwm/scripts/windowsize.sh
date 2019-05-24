#!/usr/bin/env bash

active=$(xdotool getwindowfocus)

height=$(xwininfo -id $active | grep "Height" | awk -F ":" '{print $2}')
width=$(xwininfo -id $active | grep "Width" | awk -F ":" '{print $2}')

plush=$(( $height + $1 ))
plusw=$(( $width + $2 ))

xdotool windowsize $active $plusw $plush
