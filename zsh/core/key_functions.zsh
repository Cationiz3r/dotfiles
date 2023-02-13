#!/bin/zsh

deleteFullWord()   { WORDCHARS= zle backward-delete-word; }
forwardFullWord()  { WORDCHARS= zle forward-word; }
backwardFullWord() { WORDCHARS= zle backward-word; }

clearBuffer() {
	echo -n $'\e[H\e[3J'
	clear
	promptReset
}
clearHistory() {
	local i OLDHISTSIZE=$HISTSIZE
	for i in $(seq 2 $(dirs -v|wc -l)); do popd; done
	history -p
	HISTSIZE=$OLDHISTSIZE
	clearBuffer
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
	promptReset
}
cdNext() {
	[ $#DIRSTACK -eq 0 ] && return
	pushd "$DIRSTACK[1]"
	DIRSTACK=(${DIRSTACK:1})
	promptReset
}
cdUp()   { cd ..; promptReset }
cdHome() { cd; promptReset }

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
