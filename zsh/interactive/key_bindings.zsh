#!/bin/zsh

source "$ZDOTDIR/interactive/inputrc.zsh"

# Substring search
module="/usr/share/zsh/plugins/zsh-history-substring-search/\
zsh-history-substring-search.zsh"
if [ -r "$module" ]; then
	source "$module"
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=
	HISTORY_SUBSTRING_SEARCH_FUZZY=true
	HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
else
	echo "warn: history substring search disabled" >&2
fi
unset module

# Define addition function and bind
source "$ZDOTDIR/interactive/key_functions.zsh"
bindkey '^H' backward-delete-word
bindkey '^Z' resume_or_undo
bindkey '^[^?' delete_full_word
bindkey '^[[1;3C' forward_full_word
bindkey '^[[1;3D' backward_full_word
bindkey '^L' clear_buffer
bindkey '^K' clear_history
bindkey '^Q' fast_exit
bindkey '^D' fast_exit
bindkey '^M' non_null_accept_line
bindkey '^[1' cd_back
bindkey '^[2' cd_up
bindkey '^[3' cd_home

# Macros
bindkey -s '\ew' '\C-a$(\C-e)'
bindkey -s '\el' '\C-e|less'
bindkey -s '\eq' '\C-e|count'
bindkey -s '\ej' '\C-e|jq'
bindkey -s '\eJ' '\C-e|jq -C|less'
bindkey -s '\eg' '\C-e|grep '
bindkey -s '\ee' '\C-e|grep -E'
bindkey -s '\eh' '\C-e|head '
bindkey -s '\et' '\C-e|tail '
bindkey -s '\ex' '\C-e|xargs '
bindkey -s '\es' '\C-e|sed '
bindkey -s '\er' '{,}'

# Macros (app launcher)
widget_launcher() {
	local CMD=""
	case "$KEYS" in
	$'\ec') CMD=spclock;;
	$'\ev') CMD=htop;;
	$'\eb') CMD=btop\ +t;;
	$'\en') CMD=nvtop;;
	esac
	[ -z $CMD ] && return
	if [[ $TTY =~ tty ]]; then
		BUFFER=$CMD
		zle accept-line
	else
		eval $CMD <$TTY
		zle redisplay
	fi
}
zle -N widget_launcher
bindkey '\ec' widget_launcher
bindkey '\ev' widget_launcher
bindkey '\eb' widget_launcher
bindkey '\en' widget_launcher

#Better macros
doas_() { BUFFER="doas $BUFFER"; CURSOR+=5 }
wrl_() {
	BUFFER="$BUFFER|while read l; do ; done"
	CURSOR=$(($#BUFFER - 6))
}
zle -N doas_
zle -N wrl_
bindkey '\ed' doas_
bindkey '\ea' wrl_

# Unbinding
bindkey -r '^s'
bindkey -r '^r'
bindkey -r '^[^L'
