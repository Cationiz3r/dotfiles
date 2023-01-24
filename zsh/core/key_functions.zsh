#!/bin/zsh

deleteFullWord()   { WORDCHARS= zle backward-delete-word; }
forwardFullWord()  { WORDCHARS= zle forward-word; }
backwardFullWord() { WORDCHARS= zle backward-word; }

clearBuffer() {
	echo -n $'\e[H\e[3J'
	clear
	zle-update-prompt
}
clearHistory() {
	local i OLDHISTSIZE=$HISTSIZE
	for i in $(seq 2 $(dirs -v|wc -l)); do popd; done
	history -p
	HISTSIZE=$OLDHISTSIZE
	clear-buffer
}

fastExit() exit

nonNullAcceptLine() {
	[ -z "$BUFFER" ] && return
	&>/dev/null unset -f TRAPINT
	zle accept-line
}

# File explorers like navigation
cdBack() {
	[ $(dirs -v|wc -l) -eq 1 ] && return
	local o_PWD="$PWD"
	&>/dev/null popd
	[ "$o_PWD" = "$PWD" ] && return
	DIRSTACK+=("$o_PWD")
	zle-update-prompt
}
cdNext() {
	[ $#DIRSTACK -eq 0 ] && return
	pushd "$DIRSTACK[1]"
	DIRSTACK=(${DIRSTACK:1})
	zle-update-prompt
}
cdUp()   { cd ..; zle-update-prompt }
cdHome() { cd; zle-update-prompt }

for func in \
	deleteFullWord \
	forwardFullWord \
	backwardFullWord \
	fastExit \
	clearBuffer \
	clearHistory \
	nonNullAcceptLine \
	cdBack \
	cdNext \
	cdUp \
	cdHome \
	exit
do zle -N $func; done
unset func