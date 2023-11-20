# Custom zle functions
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
		echo
		tput sgr0
		eval fg
		zle redisplay
	else
		zle undo
	fi
}

## File explorers like navigation
# Return to last dir, skip errors until current directory changes
cd_back() {
	local old_pwd="$PWD"
	while ([ $(dirs -v|wc -l) -gt 1 ] && [ "$old_pwd" = "$PWD" ]); do
		popd &>/dev/null
	done

	[ "$old_pwd" = "$PWD" ] || prompt_reset
}
cd_up() { cd ..; prompt_reset }
cd_home() { cd; prompt_reset }
# Cycles through siblings of current dir
cd_next() {
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

# Mark as zle commands
for func in \
	delete_full_word \
	forward_full_word \
	backward_full_word \
	fast_exit \
	clear_buffer \
	clear_history \
	non_null_accept_line \
	resume_or_undo \
	open_editor \
	cd_back \
	cd_up \
	cd_home \
	cd_next \
	exit
do zle -N $func; done
unset func

# Bind commands to keys
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
bindkey '^[^M' non_null_accept_line
bindkey '^[1' cd_back
bindkey '^[2' cd_up
bindkey '^[3' cd_home
bindkey '^[4' cd_next
