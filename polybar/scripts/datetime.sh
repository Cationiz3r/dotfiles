#!/bin/sh
# Datetime related functions

PRIMARY_THEME="%{T5}%{B#FFF}%{F#000}%{T2}"

# Render day number into an image
render() {
	local day="$1"

	local icons_dir="$POLYBAR_RUN/dates"
	local output="$icons_dir/$day.png"
	mkdir -vp "$icons_dir" >&2

	# Skip rendered images
	if ! [ -r "$output" ]; then
		convert \
			-size 64x62 \
			-fill white \
			-font 'Poppins-Bold' \
			-pointsize 48 \
			-gravity center \
			-draw "text 0,0 '$day'" \
			xc:none \
			"$output"
	fi

	echo "$output"
}

send_notification() {
	local day="$1"
	local summary="$2"
	local content="$3"

	local date_icon=$(render "$day")

	dunstify \
		-h string:x-dunst-stack-tag:polybar-date \
		-I "$date_icon" \
		"$summary" "$content"
}

copy() {
	local day=$(date '+%-d')
	local text=$(date '+%y%m%d_%H%M%S')

	printf '%s' "$text"|xclip
	send_notification "$day" 'Polybar' "Copied: $text"
}

# Send a notification about date of today
notify() {
	eval set -- $(date '+%-d %B %Y %A')
	local day="$1"
	local month="$2"
	local year="$3"
	local dow="$4"

	send_notification "$day" "$dow" "$month $year"
}

# Display formatted polybar string for time.
show() {
	local sync=$(./scripts/timesync.sh)
	local dow=$(date '+%a')
	local time=$(date '+%-H:%M:%S')

	echo "$dow$PRIMARY_THEME$sync$time  "
}

main() {
	case "$1" in
	copy) copy;;
	notify) notify;;
	*) show;;
	esac
}

main "$1"
