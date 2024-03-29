#!/bin/sh
cd "$(dirname "$0")"
killall -q polybar

# Wait for i3 to start and create socket
while ! pgrep i3 >/dev/null; do
	sleep 1
done
i3_pid=$(pgrep i3)
while ! [ -S "$XDG_RUNTIME_DIR/i3/ipc-socket.$i3_pid" ]; do
	sleep 1
done

# Work dirs
export POLYBAR_ROOT=$(pwd)
export POLYBAR_RUN="$XDG_RUNTIME_DIR/polybar"
mkdir -p "$POLYBAR_RUN"

# For shell scripts
export DANGER="%{T2}%{F#f00}"

exec polybar "$@"
