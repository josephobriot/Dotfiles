#!/bin/sh

prepend_zero () {
	seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" | cut -c 12-))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))

if [ -z "$artist$song" ]; then
	echo
	exit
fi

if [ -z "$artist" ]; then
	artist="∅"
elif [ -z "$song" ]; then
	artist="unknown song"
fi

echo -n "$artist - $song"

