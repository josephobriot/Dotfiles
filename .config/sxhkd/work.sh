#!/bin/bash

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

BW=$(bspc config border_width)

# in case I want overlapping borders again

# if [ "$2" -eq 0 ]
# then
# 	bspc config window_gap -$BW
# 	for side in right bottom left ; do
# 		bspc config ${side}_padding $BW
# 	done
# 	bspc config top_padding $(($totalH + $BW));
# else
	bspc config window_gap $2;
# 	for side in right bottom left ; do
# 		bspc config ${side}_padding 0
# 	done
	bspc config top_padding $totalH;
# fi

killall polybar;

polybar -r $1
