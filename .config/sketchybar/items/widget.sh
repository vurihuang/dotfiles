#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

sb_wechat() {
    sketchybar --add alias "微信,Item-0" "$1" \
        --set "微信,Item-0" update_freq=2
}

sb_qiwei() {
    sketchybar \
        --add alias "企业微信,Item-0" "$1" \
        --set "企业微信,Item-0" update_freq=2
}

sb_date() {
	sketchybar \
		--add item day "$1" --set day update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%a')" \
		--add item date "$1" --set date update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%d' | sed s/^0//)" \
		--add item month "$1" --set month update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%b')"
}

sb_clock() {
	sketchybar \
		--add item clock "$1" \
		--set clock \
		\
		update_freq=10 \
		label.font.size=14.0 \
		icon= \
		icon.drawing=off \
		script="$PLUGIN_DIR/clock.sh"
}

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="───────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_DIM"
}
