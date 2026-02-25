#!/usr/bin/env bash

# Force Num Lock on every time this key is pressed
numlockx on >/dev/null 2>&1

# Get current follow_mouse setting
current=$(hyprctl getoption input:follow_mouse | grep "int:" | awk '{print $2}')

# Check if calculator is running
if hyprctl clients | grep -q "org.gnome.Calculator"; then
    # Check if calculator is focused
    if hyprctl activewindow -j | jq -e '.class=="org.gnome.Calculator"' > /dev/null 2>&1; then
        # Calculator is focused, close it and restore FFM
        hyprctl dispatch closewindow class:^org.gnome.Calculator$
        hyprctl keyword input:follow_mouse $current
    else
        # Calculator exists but not focused, focus it
        hyprctl dispatch focuswindow class:^org.gnome.Calculator$
    fi
else
    # Calculator not running, disable FFM and launch it
    hyprctl keyword input:follow_mouse 0
    gnome-calculator &
    sleep 0.3
    hyprctl dispatch focuswindow class:^org.gnome.Calculator$
    
    # Monitor calculator and restore FFM when it closes
    (
        while hyprctl clients | grep -q "org.gnome.Calculator"; do
            sleep 1
        done
        hyprctl keyword input:follow_mouse $current
    ) &
fi
