#!/bin/zsh

delete_full_word() { WORDCHARS= zle backward-delete-word; }
forward_full_word() { WORDCHARS= zle forward-word; }
backward_full_word() { WORDCHARS= zle backward-word; }

clear_buffer() {
	echo -n $'\e[H\e[3J'
	clear
	prompt_reset
}
clear_history() {
	local i OLDHISTSIZE=$HISTSIZE
	for i in $(seq 2 $(dirs -v|wc -l)); do popd; done
	history -p
	HISTSIZE=$OLDHISTSIZE
	clear_buffer
}

fast_exit() exit

non_null_accept_line() {
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
cd_back() {
	# Return to last dir, ignore errors (eg: deleted)
	[ $(dirs -v|wc -l) -eq 1 ] && return
	local o_PWD="$PWD"
	&>/dev/null popd

	[ "$o_PWD" = "$PWD" ] && return
	prompt_reset
}
cd_up() { cd ..; prompt_reset }
cd_home() { cd; prompt_reset }
cd_next() {
	# Cycles between siblings of current dir
	local found_cur
	local cur=${PWD##*/}

	# Check if we're in /
	[ -z "$cur" ] && return 1

	local i
	for i in ../*/; do
		if [ -n "$found_cur" ]; then
			if [ -d "$i" ]; then
				cd "$i"
				prompt_reset
				return
			fi
		elif [ "${i#../}" == "$cur/" ]; then
			found_cur=true
		fi
	done

	# Loop back to first sibling
	for i in ../*/; do
		cd "$i"
		prompt_reset
		return
	done
}

for func in \
	delete_full_word \
	forward_full_word \
	backward_full_word \
	fast_exit \
	clear_buffer \
	clear_history \
	non_null_accept_line \
	resume_or_undo \
	cd_back \
	cd_up \
	cd_home \
	cd_next \
	exit
do zle -N $func; done
unset func
