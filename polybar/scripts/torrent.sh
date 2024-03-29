#!/bin/sh
# Works for deluge

format() { echo "$1"|numfmt --to iec --format "%.${2}f"; } #1:number 2:decplace

set -- #empty array
while true; do
	echo "..."
	last=$(python "$POLYBAR_ROOT"/scripts/deluge.py)
	if [ -z "$last" ]; then
		set --
		echo
		sleep 60
		continue
	fi
	set -- "$@" "$last"
	[ $# -gt 181 ] && shift #3 hours
	speed=\?
	[ $# -gt 1 ] && speed=$(format $(( ($last-$1)*60/($#-1) )) 1)
	echo "$(format $last 3)  $speed/h"
	sleep 60
done

