#!/bin/zsh

. "$ZDOTDIR/modules/substring-search"
bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[5~' beginning-of-history
bindkey '\e[6~' end-of-history
bindkey '\e[7~' beginning-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' quoted-insert
bindkey '\e[5C' forward-word
bindkey '\e[5D' backward-word
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '\e[8~' end-of-line
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

delete-pure-word()   { WORDCHARS= zle backward-delete-word; }
forward-pure-word()  { WORDCHARS= zle forward-word; }
backward-pure-word() { WORDCHARS= zle backward-word; }
clear-buffer() { echo -n $'\e[H\e[3J'; clear; zle-update-prompt }
clear-history() {
	local i OLDHISTSIZE=$HISTSIZE
	for i in $(seq 2 $(dirs -v|wc -l)); do popd; done
	history -p
	HISTSIZE=$OLDHISTSIZE
	clear-buffer
}
just-exit() { exit }
better-accept-line() {
	[ -z "$BUFFER" ] && return
	&>/dev/null unset -f TRAPINT
	zle accept-line
}
cd-back() {
	[ $(dirs -v|wc -l) -eq 1 ] && return
	local o_PWD="$PWD"
	&>/dev/null popd
	[ "$o_PWD" = "$PWD" ] && return
	DIRSTACK+=("$o_PWD")
	zle-update-prompt
}
cd-next() {
	[ $#DIRSTACK -eq 0 ] && return
	pushd "$DIRSTACK[1]"
	DIRSTACK=(${DIRSTACK:1})
	zle-update-prompt
}
cd-up()   { cd ..; zle-update-prompt }
cd-home() { cd; zle-update-prompt }
for func in delete-pure-word forward-pure-word backward-pure-word \
	clear-buffer clear-history just-exit better-accept-line \
	cd-back cd-next cd-up cd-home cd-copy cd-paste; do zle -N $func; done; unset func
bindkey '^H' backward-delete-word
bindkey '^[^?' delete-pure-word
bindkey '^[^L' clear-buffer
bindkey '^K' clear-history
bindkey '^[[1;3C' forward-pure-word
bindkey '^[[1;3D' backward-pure-word
bindkey '^D' just-exit
bindkey '^M' better-accept-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[1' cd-back
bindkey '^[2' cd-next
bindkey '^[3' cd-up
bindkey '^[4' cd-home
bindkey '^Z' undo

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
widget-launcher() {
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
}; zle -N widget-launcher
bindkey '\ec' widget-launcher
bindkey '\ev' widget-launcher
bindkey '\eb' widget-launcher
bindkey '\en' widget-launcher

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
