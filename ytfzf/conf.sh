#!/bin/sh

is_detach=1
is_loop=1 # returns to list
sub_link_count=5
pages_to_scrape=3

video_player() {
	echo "playing: $@"
	mpv --profile=youtube "$@"
}
audio_player() {
	echo "playing: $@"
	mpv --profile=music "$@"
}
