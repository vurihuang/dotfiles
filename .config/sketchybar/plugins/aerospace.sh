#!/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchbar --set $NAME background.drawing=on
else
  sketchbar --set $NAME background.drawing=off
fi
