# PROMPT_USER: username to display (hidden by default)
# PROMPT_HOST: hostname of system
# PROMPT_PRIV: set if sudo or doas is used, shows username
# PROMPT_SSH: set if ssh is used, shows as prefix
# PROMPT_MAX_PWDLEN: max length of pwd PART of the prompt
#   hidden if current dir is $HOME or '~'

preexec() {
	tput sgr0
}
precmd() {
	prompt_update
	TRAPINT() {
		zle kill-whole-line
		prompt_reset
	}
}

prompt_pwd() { # shorten: 2=maxlength
	local cutoff='..'
	local pwd="${PWD/#$HOME/~}"
	local offset=$((${#pwd} - $PROMPT_MAX_PWDLEN + ${#cutoff}))
	if [ $offset -gt 0 ]; then
		pwd="${pwd:$offset}"
		pwd="$cutoff$([[ "$pwd" == */* ]] && echo /)${pwd#*/}"
	fi
	[ "$pwd" = "~" ] && echo || echo "$pwd"
}

prompt_update() {
	# Update cursor when tmux or tty is dectected
	tty|grep -q tty && printf '\e[?0c'
	[ -n "$TMUX" ] && printf '\e[3 q'

	local userhost="$PROMPT_HOST" user="$PROMPT_USER"
	[ "$EUID" -eq 0 ] && user="%U%F{15}$user%u%F{14}"
	[ -n "$PROMPT_PRIV" ] && userhost="$user@$userhost"
	[ -n "$PROMPT_SSH" ] && userhost="ssh:$userhost"
	local venv
	[ -n "$PIPENV_ACTIVE" ] && venv=" venv"
	local pwd=$(prompt_pwd)
	[ -n "$pwd" ] && pwd="%F{12}$pwd "
	local git=$(2>/dev/null git branch|grep \*|cut -b3-)
	if [ -n "$git" ]; then
		git="%F{10}$git"
		[ -z "$(git diff 2>/dev/null)" ] || git+="%F{9}*"
		git+=' '
	fi

	local sign=❯
	[ "$EUID" -eq 0 ] && sign=#
	PS1="%B%F{15}▍%F{14}$userhost$venv $pwd$git%F{15}$sign " # 258D
}

prompt_init() {
	PROMPT_USER="$USER"
	PROMPT_HOST="$HOST"
	local shorthn=$(grep -oP '(?<=short:).*' /etc/hostname|head -1)
	[ -n "$shorthn" ] && PROMPT_HOST="$shorthn"
	PROMPT_MAX_PWDLEN=30
	local tree=$(pstree -s $$) #pstree takes a while
	echo "$tree"|grep -q sshd && PROMPT_SSH=yes
	echo "$tree"|grep -q 'sudo\|doas' && PROMPT_PRIV=yes
	zle_highlight=(none)

	# Terminal emulator logout after 20 mins
	if [[ "$(tty)" =~ tty ]]; then
		TMOUT=1200
		TRAPALRM() {
			tput reset
			exit
		}
		TERM=linux-16color
	fi
}

prompt_reset() {
	prompt_update
	zle reset-prompt
}

prompt_init
