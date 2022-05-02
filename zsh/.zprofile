#!/bin/zsh
#	                        __ _ _
#	   _____ __  _ __ ___  / _(_) | ___
#	  |_  / '_ \| '__/ _ \| |_| | |/ _ \
#	 _ / /| |_) | | | (_) |  _| | |  __/
#	(_)___| .__/|_|  \___/|_| |_|_|\___|
#	      |_|

clear

# Autostart Xserver
if [ -z "$DISPLAY$TERM_PROGRAM$(pgrep Xorg)" -a $XDG_VTNR = 1 ]; then
	command mkdir -p $XDG_RUNTIME_DIR/Xorg
	xinit -- :0 &>$XDG_RUNTIME_DIR/Xorg/:0
fi
