#!/bin/sh

is_detach=1
is_loop=1 # returns to list
is_sort=1
search_sort_by=upload_date
sub_link_count=5
pages_to_scrape=3

video_player() {
	mpv --profile=youtube "$@"
}
audio_player() {
	mpv --profile=music "$@"
}
