#!/bin/zsh

# Reload
alias refresh='. $ZDOTDIR/.zshenv; . $ZDOTDIR/.zshrc'

# Filesystem (more verbose)
alias ls='exa -ag --group-directories-first' # replace ls with exa
alias ll='ls -l'
alias la='ll -a'
alias l='ls -D'
alias lm='ls -snewest'
alias ld='ll -ssize'
alias lo='ls -soldest'
alias cp='cp -ivr'
alias mv='mv -iv'
alias rm='rm -vr'
alias ln='ln -v'
alias mkdir='mkdir -vp'
alias rmdir='rmdir -v'
alias rename='rename -v'

# Verbose
alias gzip='gzip -v'
alias fd='fd -uu'

# Quite
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# Colorize
alias grep='grep --color=auto'
alias pactree='pactree -c'
alias diff='diff --color=auto -uT --palette "hd=34;1:rs=95;1:de=91;2:ad=97;1"'

# Misc replace
alias less='less -FRix2'
alias bat='bat --tabs 2'
alias time='command time -p'
alias wget='wget -c --show-progress --hsts-file /dev/null'
alias twget='torsocks wget -c --show-progress --hsts-file /dev/null'
alias shred='shred -vu --random-source=/dev/urandom'
alias ps='ps aux'
alias speedtest='speedtest --secure --bytes'
alias sleep='date "+[%Y-%m-%d %H:%M:%S] sleep"; sleep'
alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'

df() {
	# Sort disk free content results
	local out=$(command df -hxdevtmpfs "$@")
	echo "$out"|head -1
	echo "$out"|tail +2|sort
}
du() {
	# List size of direct files/dirs in args and display in table
	command du -ahd1 --apparent-size "$@"|\
		sort -h|\
		sed 's:\t\./:\t:'|\
		column -ts$'\t'
}

# Shortcuts
alias re=rename
alias py='python'
alias play='mpv --profile=music'
alias g='git'
alias n='nvim'
alias wf='nmcli dev wifi con'
alias wfls='nmcli dev wifi re; nmcli dev wifi'
alias con='nmcli dev con'
alias dis='nmcli dev dis'
alias yt='ytfzf'
alias ytc='ytfzf --sort -cS'

# Background processes
detach() { nohup "$@" &>/dev/null &| }
alias v='detach mpv --no-terminal --profile=gallery'
startx() command startx "$XINITRC" -- "$XSERVERRC" &>"$XLOG"
if [ -n "$DISPLAY" ]; then
	detach() { nohup "$@" &>>"$XLOG" &| }
	alias \
		kr='detach krita' \
		lp='detach leafpad' \
		za='detach zathura'
fi

# Utilities
alias path='tr : \\n <<<$PATH'
alias pubip='curl https://ifconfig.me && echo'
alias now='date +%y%m%d_%H%M%S'
alias printq='printf "%q\n"'
alias cenv='env -i TERM="$TERM" USER=clear LANG="$LANG" HISTFILE='
alias xpcn="xprop \
_NET_WM_PID \
WM_CLASS \
WM_NAME \
_OB_APP_CLASS \
_OB_APP_NAME \
_OB_APP_TYPE \
_OB_APP_TITLE \
_OB_APP_ROLE"
alias count='sort|uniq -c|sort -n'
alias webcam='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'

qr() {
	# Pipe for qrcode generation
	tput setaf 15
	qrencode -tUTF8 "$@"
}

# Simple symmetric gpg encrypt/decrypt functions
enc() {	gpg -c --no-symkey-cache --cipher-algo AES256 -o "$(basename "$1").gpg" "$1" }
dec() { gpg -d -o "$(basename "$1" .gpg)" "$1" }

share() {
	# Grant group read/write access for current pwd
	# and change group name if specified
	fd -tf -x chmod g+rw  {}
	fd -td -x chmod g+rwx {}
	chmod g+rwx . # fd doesn't include current dir
	if [ -n "$1" ] && grep -qE "^$1:" /etc/group; then
		chown ":$1" -R .
	else
		echo "warning: sharing self-group"
	fi
}

die() {
	# Remove current dir and back out
	rm "$@" "$PWD"
	cd ..
}

mkcd() {
	# Make many dirs and cd into the first valid one
	mkdir "$@"
	while [ $# -gt 0 ]; do
		if [ -d "$1" ]; then
			cd "$1"
			return
		fi
		shift
	done
}

# Create alias if in tmux (fix neovim exit)
if [ -n "$TMUX" ]; then
	nvim() {
		command nvim "$@"
		printf '\e[3 q' # blinking underscore
	}
fi
