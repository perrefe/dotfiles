#!/bin/bash

# Native macOS Mission Control spaces (1..5).
# Sketchybar's `space` component auto-tracks the focused Mission Control space
# via `associated_space` and exposes $SELECTED to the script.
#
# Click switches space via System Events key code. For this to work, enable
# "Switch to Desktop N" shortcuts in:
#   System Settings > Keyboard > Keyboard Shortcuts > Mission Control
# (defaults are Ctrl+1..N but are often disabled out of the box).

SPACE_ICONS=("1" "2" "3" "4" "5")
# US-ANSI key codes for digits 1..5 (note 5 = 23, not 22 — digit row isn't sequential)
KEY_CODES=(18 19 20 21 23)

for i in "${!SPACE_ICONS[@]}"; do
  sid=$((i+1))
  sketchybar --add space space.$sid left \
             --set space.$sid \
                associated_space=$sid \
                icon="${SPACE_ICONS[i]}" \
                icon.padding_left=8 \
                icon.padding_right=8 \
                label.drawing=off \
                background.corner_radius=5 \
                background.height=20 \
                background.drawing=off \
                script="$PLUGIN_DIR/space.sh" \
                click_script="osascript -e 'tell application \"System Events\" to key code ${KEY_CODES[i]} using control down'"
done
