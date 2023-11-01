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
	local url
	for url in "$@"; do
		_pretty_print 'play' "$url"
	done
	mpv --profile=youtube "$@"
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

custom_shortcut_binds=alt-x

handle_keypress_alt_x() {
	local url=$(cat "$ytfzf_selected_urls"|head -1)
	_pretty_print 'recommend' "$url"
	ytfzf -cR "$url"
	return 3
}
