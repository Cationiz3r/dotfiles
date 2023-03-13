#!/bin/sh

is_detach=1
is_loop=1 # returns to list
sub_link_count=5
pages_to_scrape=3

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
