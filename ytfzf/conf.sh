#!/bin/sh

is_detach=1
is_loop=1 # returns to list
sub_link_count=5
pages_to_scrape=3

enable_hist=0
enable_search_hist=0

show_thumbnails=1

mpv_yt() {
	set -- mpv --profile=youtube "$@"
	echo "$@"
	"$@"
}
video_player() {
	mpv_yt "$@"
}
audio_player() {
	mpv_yt --profile=music "$@"
}

download_thumbnails() {
	# Cache the downloaded thumbnails into a sub-directory in global cache dir
	# If they don't exist, download in multi-thread with aria2c
	local line
	local download_dir="$cache_dir/thumbnails"
	local threads=8
	mkdir -p "$download_dir"
	for line in "$@"; do
		local thumb_basename="${line##*';'}.jpg"
		local thumb_path="$download_dir/$thumb_basename"
		ln -sf -- "$thumb_path" "$thumb_dir" >&2
		[ -f "$thumb_path" ] && continue
		printf \
			"%s\n out=%s\n" \
			"${line%%';'*}" \
			"$thumb_basename"
	done|
	aria2c \
		--console-log-level=warn \
		--summary-interval=5 \
		-s"$threads" \
		-x"$threads" \
		-d"$download_dir" \
		-i-
}
