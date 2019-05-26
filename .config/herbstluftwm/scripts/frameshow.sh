#!/usr/bin/env bash

while read -r event ; do
    case $event in
        focus_changed*|tag_changed*|changed*)
            client=$(herbstclient attr tags.focus.curframe_wcount)
            clients=$(herbstclient attr tags.focus.client_count)
            frames=$(herbstclient attr tags.focus.frame_count)
            if [ $client -eq 0 ]
            then
                herbstclient set frame_border_width 3
                herbstclient set frame_padding 0
            else
                herbstclient set frame_border_width 0
                if [ $frames -gt 1 ]
                then
                    herbstclient set frame_padding 3
                fi
            fi

            if [ $clients -eq 1 -a $frames -eq 1 ]
            then
                herbstclient attr theme.minimal.border_width 0
            else
                herbstclient attr theme.minimal.border_width 3
            fi
        ;;
    esac
done < <(herbstclient --idle)
