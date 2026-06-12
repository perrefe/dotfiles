#!/bin/bash

# Driven by sketchybar's native `space` component. $SELECTED is "true" when
# this item's associated Mission Control space is focused.
# https://felixkratz.github.io/SketchyBar/config/components#space

source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --animate tanh 20 \
             --set "$NAME" background.drawing=on \
                           background.color="$BACKGROUND_2" \
                           icon.color="$YELLOW"
else
  sketchybar --animate tanh 20 \
             --set "$NAME" background.drawing=off \
                           icon.color="$GREY"
fi
