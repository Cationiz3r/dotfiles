#!/bin/zsh
[[ "$(tty)" =~ tty ]] && {
	tput reset
	setfont
	[ $(basename $(tty)) = $(cat /sys/devices/virtual/tty/tty0/active) ] && chvt 3
}
