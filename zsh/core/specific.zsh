#!/bin/zsh

[ -r "$ZSPECDIR/.zshrc" ] && . "$ZSPECDIR/.zshrc"
[ -d "$ZSPECDIR/completions" ] && for i in "$ZSPECDIR/completions"/_*; do
	. $i; done; unset i
&>/dev/null which -p pacman && . "$ZDOTDIR/modules/pacman"
&>/dev/null which -p startx && . "$ZDOTDIR/modules/xorg"
