#!/bin/zsh

preexec() {
	tput sgr0
	tabs -2
}
precmd() {
	prompt update
	TRAPINT() { zle kill-whole-line; zle-update-prompt }
}
prompt() {
case "$1" in
p*) # shorten: 2=maxlength
	local cutoff='..'
	local pwd="${PWD/#$HOME/~}"
	local max_len=$2
	local offset=$((${#pwd} - max_len + ${#cutoff}))
	if [ $offset -gt 0 ]; then
		pwd="${pwd:$offset}"
		pwd="$cutoff$([[ "$pwd" == */* ]] && echo /)${pwd#*/}"
	fi
	pwd="$delim$pwd"
	echo "$pwd"
	;;
u*)
	local userhost="$PROMPT_HOST" user="$PROMPT_USER"
	[ "$EUID" -eq 0 ] && user="%U%F{15}$user%u%F{14}"
	[ -n "$PROMPT_PRIV" ] && userhost="$user@$userhost"
	[ -n "$PROMPT_SSH" ] && userhost="ssh:$userhost"
	local pwd=$(prompt pwd 30)
	[ "$pwd" = "~" ] && pwd="" || pwd="%F{12}$pwd "
	local git=$(2>/dev/null git branch|grep \*|cut -b3-)
	if [ -n "$git" ]; then
		git="%F{10}$git"
		[ -z "$(git diff 2>/dev/null)" ] || git+=\*
		git+=' '
	fi

	local sign=❯
	[ "$EUID" -eq 0 ] && sign=#
	PS1="%B%F{15}██ %F{14}$userhost $pwd$git%F{15}$sign "
	;;
i*)
	PROMPT_USER="$USER"
	PROMPT_HOST="$HOST"
	local shorthn=$(grep -oP '(?<=short:).*' /etc/hostname|head -1)
	[ -n "$shorthn" ] && PROMPT_HOST="$shorthn"
	local tree=$(pstree -s $$) #pstree takes a while
	echo "$tree"|grep -q sshd && PROMPT_SSH=yes
	echo "$tree"|grep -q 'sudo\|doas' && PROMPT_PRIV=yes
	zle_highlight=(none)
	if [[ "$(tty)" =~ tty ]]; then
		TMOUT=1200
		TRAPALRM() { tput reset; exit }
		TERM=linux-16color
	fi
	;;
esac
}
prompt init
zle-update-prompt() { prompt update; zle reset-prompt }
