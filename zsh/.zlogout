#!/bin/zsh
tput sgr0
if [ -n "$XDG_VTNR" ]; then
	tput reset
	setfont
fi
