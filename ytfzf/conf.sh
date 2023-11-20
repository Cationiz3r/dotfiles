#!/bin/sh

is_detach=1
is_loop=1 # returns to list
sub_link_count=30
pages_to_scrape=3

show_thumbnails=1
fzf_preview_side=up

keep_cache=1

_pretty_print() {
	echo "$(tput bold)$(tput setaf 15)▍ytfzf \
$(tput setaf 12)$1$(tput setaf 15) ❯ $2$(tput sgr0)"
}

mpv_yt() {
	# Get all titles of video
	local titles
	local index=1
	local url
	for url in "$@"; do
		local title
		title=$(
			cat "$session_cache_dir/videos_json"|
			jq -r ".[]|select(.url == \"$url\")|.title"
		)
		if [ $# -gt 1 ]; then
			titles="$titles$index. $title\n"
			index=$(( index + 1 ))
		else
			titles="$title"
		fi
	done

	dunstify -I "$XDG_CONFIG_HOME/ytfzf/icon.png" 'ytfzf/mpv' "$titles"
	nohup mpv --profile=pseudo-gui --profile=youtube "$@" >/dev/null 2>&1 &
	_pretty_print 'recommend' "$1"
	ytfzf -cR "$1"
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
	local data=$(
		for line in "$@"; do
			local thumb_basename="${line##*';'}.jpg"
			local thumb_path="$download_dir/$thumb_basename"
			ln -sf -- "$thumb_path" "$thumb_dir" >&2
			[ -f "$thumb_path" ] && continue
			printf \
				"%s out=%s\n" \
				"${line%%';'*}" \
				"$thumb_basename"
		done|
		sort -u|
		sed 's/ /\n /'
	)
	[ -z "$data" ] && return
	echo "$data"|aria2c \
		--console-log-level=warn \
		--summary-interval=0 \
		--auto-file-renaming=false \
		-s"$threads" \
		-x"$threads" \
		-d"$download_dir" \
		-i-
}
