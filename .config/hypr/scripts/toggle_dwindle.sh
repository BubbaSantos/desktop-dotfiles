#!/bin/bash
config="$HOME/.config/hypr/looknfeel.conf"
RATIO_FILE="$HOME/.cache/hypr-split-ratio"

if grep -q "^[[:space:]]*default_split_ratio = 1.45" "$config"; then
    # Currently 1.45 → switch to 1.55
    sed -i 's/^[[:space:]]*default_split_ratio = 1.45/    default_split_ratio = 1.55/' "$config"
    echo "1.55" > "$RATIO_FILE"
    hyprctl reload
    notify-send "Dwindle Layout" "Split ratio 1.55" -u low

elif grep -q "^[[:space:]]*default_split_ratio = 1.55" "$config"; then
    # Currently 1.55 → switch to 1.6
    sed -i 's/^[[:space:]]*default_split_ratio = 1.55/    default_split_ratio = 1.6/' "$config"
    echo "1.6" > "$RATIO_FILE"
    hyprctl reload
    notify-send "Dwindle Layout" "Split ratio 80/20" -u low

elif grep -q "^[[:space:]]*default_split_ratio = 1.6" "$config"; then
    # Currently 1.6 → switch to 50/50 (comment out)
    sed -i 's/^[[:space:]]*default_split_ratio = 1.6/    #default_split_ratio = 1.45/' "$config"
    sed -i 's/^[[:space:]]*force_split = 2/    #force_split = 2/' "$config"
    echo "1.0" > "$RATIO_FILE"
    hyprctl reload
    notify-send "Dwindle Layout" "Split ratio 50/50" -u low

else
    # Currently commented out (50/50) → switch to 1.45
    sed -i 's/^[[:space:]]*#default_split_ratio = 1.45/    default_split_ratio = 1.45/' "$config"
    sed -i 's/^[[:space:]]*#force_split = 2/    force_split = 2/' "$config"
    echo "1.45" > "$RATIO_FILE"
    hyprctl reload
    notify-send "Dwindle Layout" "Split ratio 65/35" -u low
fi
