#!/bin/zsh
#	       _             _
#	   ___| | ___   __ _(_)_ __
#	  |_  / |/ _ \ / _` | | '_ \
#	 _ / /| | (_) | (_| | | | | |
#	(_)___|_|\___/ \__, |_|_| |_|
#	               |___/

# Screen brightness & Volume control
#ncurses-notify() {
#	local padding=2 ptf="/tmp/ncurses_$XDG_VTNR"
#	local align_left=$((COLUMNS * 3 / 4 - ${#1} / 2 - padding))
#	echo "${#1}" >> "$ptf"
#	printf $'\e7'
#	tput cup 0 $align_left
#	print -nP '%B%F{12}'
#	echo "$(printf %${padding}s)$1$(printf %${padding}s)"
#	printf $'\e8'
#	sleep .5s
#	sed -i '1d' "$ptf"
#	[ $(wc -l "$ptf" | cut -d' ' -f1) -gt 0 ] && return
#	printf $'\e7'
#	tput cup 0 $align_left
#	printf "%$((${#1} + padding * 2))s"
#	printf $'\e8'
#}
#mute-volume() {
#	local notif=$(pavol -m)
#	ncurses-notify "$notif" &|
#} && zle -N mute-volume
#decrease-volume() {
#	local notif=$(pavol -5%)
#	ncurses-notify "$notif" &|
#} && zle -N decrease-volume
#increase-volume() {
#	local notif=$(pavol +5%)
#	ncurses-notify "$notif" &|
#} && zle -N increase-volume
#decrease-brightness() {
#	local notif=$(scrlight -a-5%)
#	ncurses-notify "$notif" &|
#} && zle -N decrease-brightness
#increase-brightness() {
#	local notif=$(scrlight -a5%)
#	ncurses-notify "$notif" &|
#} && zle -N increase-brightness
#flash-keyboard() {
#	keylight -f
#} && zle -N flash-keyboard
#
#bindkey '^[`' mute-volume
#bindkey '^[3' decrease-volume
#bindkey '^[4' increase-volume
#bindkey '^[5' decrease-brightness
#bindkey '^[6' increase-brightness
#bindkey '^[^[' flash-keyboard
