#!/bin/zsh
#	                        __ _ _
#	   _____ __  _ __ ___  / _(_) | ___
#	  |_  / '_ \| '__/ _ \| |_| | |/ _ \
#	 _ / /| |_) | | | (_) |  _| | |  __/
#	(_)___| .__/|_|  \___/|_| |_|_|\___|
#	      |_|

[ -n "$XDG_VTNR" ] && clear
# Autostart Xserver
if [ -z "$DISPLAY$TERM_PROGRAM" -a "$XDG_VTNR" = 1 ]; then
	mpd-init &>/dev/null &|
	mkdir -p $XDG_RUNTIME_DIR/Xorg
	startx "$XINITRC" -- "$XSERVERRC" &>"$XLOG"
fi
