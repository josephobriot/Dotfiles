# MUST BE PYWAL<=3.2.1 (removed gtk support for whatever reason)
files=(~/Images/Wallpapers/papes/*)
sh -c "wal -s -i ${files[RANDOM % ${#files[@]}]} -g"
wal_steam -w -d
# -b \"#14161b\" 
#  ^ = to set backround manually

# source the colors.
. "${HOME}/.cache/wal/colors.sh"

# Color settings with pywal

# Set the border colors.
bspc config normal_border_color "$color0"
bspc config active_border_color "$color2"
bspc config focused_border_color "$color1"
bspc config presel_feedback_color "$color1"

killall dunst
dunst \
-lb "$color0" -lf "$color7" -lfr "$color1" \
-nb "$color0" -nf "$color7" -nfr "$color1" \
-cb "$color0" -cf "$color7" -cfr "$color1" &
sleep 0.5
notify-send "Bspwm Loaded" "uwu"
