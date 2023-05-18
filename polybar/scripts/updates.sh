#!/bin/sh

force() {	ps -p $SLEEP_PID >/dev/null && kill $SLEEP_PID; }
trap force USR1

CACHE="$POLYBAR_RUN/updates"

out() { echo " $@ "; }

wait_online() {
	out ..\?
	for i in $(seq 0 7); do
		ping -c1 archlinux.org >/dev/null 2>&1 && break
		sleep 15
	done
}

get_packages() {
	# Returns number of updatable packages
	if grep -q 'ERROR' "$CACHE"; then
		echo 0
		return 1
	fi
	cat "$CACHE"|wc -l
}

get_external() {
	# Custom script pkgwatch
	if ! command -v pkgwatch >/dev/null; then
		echo 0
		return 1
	fi
	pkgwatch|wc -l
}

get_info() {
	wait_online
	out ...
	[ -f "$CACHE" ] || checkupdates 2>&1 >"$CACHE"

	local pkgs=$(get_packages)
	local ext=$(get_external)

	if [ $((pkgs + ext)) -eq 0 ]; then
		echo
		return
	fi

	local ext_str
	[ $ext -gt 0 ] && ext_str=".$ext"
	out "$pkgs$ext_str"
}

while true; do
	get_info

	sleep 3h & SLEEP_PID=$!
	wait
	rm "$CACHE"
done
