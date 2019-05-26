#!/usr/bin/env bash

Floatkey=${Floatkey:-Alt-space}

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}

if which xwininfo &> /dev/null; then
    size=$(xwininfo -root |
           sed -n -e '/^  Width: / {
                          s/.*: //;
                          h
                      }
                      /^  Height: / {
                          s/.*: //g;
                          H;
                          x;
                          s/\n/x/p
                      }')
else
    echo "This script requires the xwininfo binary."
    exit 1
fi

hc chain , add "$floatingTagName" , floating "$floatingTagName" on
hc or , add_monitor "$size"+0+0 "$floatingTagName" "$floatingMonitorName" \
      , move_monitor "$floatingMonitorName" "$size"+0+0
hc raise_monitor "$floatingMonitorName"
hc lock_tag "$floatingMonitorName"

# doesn't work cuz don't have the script, don't need it but I keep it dead here
cmd=(
or  case: and
        # if not on floating monitor
        . compare monitors.focus.name != "$floatingMonitorName"
        # and if a client is focused
        . get_attr clients.focus.winid
        # and then move the client to the floating tag
        . substitute WINDOW clients.focus.winid
            spawn $HOME/.config/herbstluftwm/scripts/shiftWindowToFloatingMonitor.sh WINDOW
        . true
    case: and
        # if on the floating monitor
        . compare monitors.focus.name = "$floatingMonitorName"
        # and if a client is focused
        . get_attr clients.focus.winid
        # then send it back to the original monitor
        . substitute WINDOW clients.focus.winid 
            spawn $HOME/.config/herbstluftwm/scripts/shiftWindowToItsMonitor.sh WINDOW
        . true
    case: and
        # if the previous things fail,
        # just move to the first monitor
        . shift_to_monitor 0
        . focus_monitor 0
)

hc keybind $Mod-$Floatkey "${cmd[@]}"
