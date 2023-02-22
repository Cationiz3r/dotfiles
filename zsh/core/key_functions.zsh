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
cd() {
	# Reset DIRSTACK on manual cd
	DIRSTACK=()
	pushd "$1"
}
cdBack() {
	# Return to last dir, ignore errors (eg: deleted)
	[ $(dirs -v|wc -l) -eq 1 ] && return
	local o_PWD="$PWD"
	&>/dev/null popd

	# Append old dir to stack if different
	[ "$o_PWD" = "$PWD" ] && return
	DIRSTACK+=("$o_PWD")
	promptReset
}
cdNext() {
	# Pop return stack
	[ $#DIRSTACK -eq 0 ] && return
	pushd "$DIRSTACK[-1]"
	DIRSTACK=(${DIRSTACK:0:-1})
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
