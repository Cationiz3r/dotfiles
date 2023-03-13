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

resume_or_undo() {
	if [ $#BUFFER -eq 0 ] && [ $(jobs|wc -l) -gt 0 ]; then
		BUFFER=fg
		zle accept-line
	else
		zle undo
	fi
}

# File explorers like navigation
cdBack() {
	# Return to last dir, ignore errors (eg: deleted)
	[ $(dirs -v|wc -l) -eq 1 ] && return
	local o_PWD="$PWD"
	&>/dev/null popd

	[ "$o_PWD" = "$PWD" ] && return
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
	resume_or_undo \
	cdBack \
	cdUp \
	cdHome \
	exit
do zle -N $func; done
unset func
