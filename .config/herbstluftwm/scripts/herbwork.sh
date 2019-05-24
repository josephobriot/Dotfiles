#!/bin/bash

herbstclient set window_gap $2
herbstclient set frame_gap $2

if [ $2 -eq 0 ]
then
    herbstclient set smart_frame_surroundings 1
else
    herbstclient set smart_frame_surroundings 0
fi

reg=":a;N;\$!ba;s/\\n/;/g;s/\\[bar\\/$1\\]/&\\n/;s/.*\\n//;s/\\[.*\\]/\\n&/;s/\\n.*//;s/;/\\n/g"
echo $reg

height=$(cat ~/.config/polybar/config | sed -e '/^;/d;/^$/d' | sed -e $reg | sed -n '/height/p' | sed -e 's/height.*\=//' -e 's/^[ \t]*//');
borders=$(cat ~/.config/polybar/config | sed -e '/^;/d;/^$/d' | sed -e $reg | sed -n '/border-size/p' | sed -e 's/border-size.*\=//' -e 's/^[ \t]*//');
borders=${borders:-0}
borderB=$(cat ~/.config/polybar/config | sed -e '/^;/d;/^$/d' | sed -e $reg | sed -n '/border-bottom/p' | sed -e 's/border-bottom.*\=//' -e 's/^[ \t]*//');
borderB=${borderB:-$borders}
borderT=$(cat ~/.config/polybar/config | sed -e '/^;/d;/^$/d' | sed -e $reg | sed -n '/border-top/p' | sed -e 's/border-top.*\=//' -e 's/^[ \t]*//');
borderT=${borderT:-$borders}

echo $height
echo $borders
echo $borderB
echo $borderT
totalH=$(($height + $borderB + $borderT))
echo $totalH

herbstclient pad 0 $totalH 0 0 0
herbstclient pad 1 $totalH 0 0 0

killall polybar

polybar -r $1
