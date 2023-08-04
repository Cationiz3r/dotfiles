#!/bin/sh

if [ -t 1 ]; then
	echo "warn: not printing to terminal" >&2
	exit 1
fi

cd "$(dirname "$0")"
cat \
	arkenfox/user.js \
	custom.js \
