#!/bin/zsh
#     _    _ _
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/
#
alias \
	ls='exa -ag --group-directories-first' \
	ll='ls -l' \
	la='ll -a' \
	l='ls -D' \
	lm='ls -snewest' \
	ld='ll -ssize' \
	lo='ls -soldest' \
	cp='cp -ivr' \
	mv='mv -iv' \
	rm='rm -vr' \
	ln='ln -v' \
	mkdir='mkdir -vp' \
	rmdir='rmdir -v' \
	rename='rename -v' \
	re=rename \
	gzip='gzip -v' \
	py='python' \
	path='tr : \\n <<<$PATH' \
	refresh='. ~/.config/zsh/.zshrc; echo' \
	grep='grep --color=auto' \
	egrep='egrep --color=auto' \
	fgrep='fgrep --color=auto' \
	pactree='pactree -c' \
	diff='diff --color=auto -uT --palette "ad=0;97"' \
	less='less -FRx2' \
	ffmpeg='ffmpeg -hide_banner' \
	ffprobe='ffprobe -hide_banner' \
	time='command time -p' \
	btop='btop +t' \
	wget='wget -c --show-progress --hsts-file /dev/null' \
	xargs='xargs -t' \
	fd='fd -uu --show-errors' \
	bat='bat --tabs 2' \
	shred='shred -vu --random-source=/dev/urandom' \
	ps='ps aux' \
	play='mpv --profile=music' \
	yd3='yt-dlp -xfba --audio-format mp3' \
	yd4='yt-dlp -f"bv*[height<=480]+ba/b[height<=480]/wv*+ba/w"' \
	xpcn='xprop _NET_WM_PID WM_CLASS WM_NAME _OB_APP_CLASS _OB_APP_NAME _OB_APP_TYPE _OB_APP_TITLE _OB_APP_ROLE' \
	netspeed='speedtest --secure --bytes' \
	weather='curl "wttr.in/Haiphong?MQT0"' \
	pubip='curl https://ifconfig.me && echo' \
	now='date +%y%m%d_%H%M%S' \
	printq='printf "%q\n"' \
	cenv='env -i TERM="$TERM" USER=clear LANG="$LANG" HISTFILE=' \

df() { command df -h|head -1; command df -hxdevtmpfs "$@"|tail +2|sort }
du() { command du -ahd1 --apparent-size "$@"|sort -h|sed 's:\./::'|column -ts$'\t' }
qr() { echo $'\e[1;37m'"$(qrencode -tUTF8 "$@")"$'\e[0m' }
enc() { gpg -c --no-symkey-cache --cipher-algo AES256 -o "$(basename "$1").gpg" "$1" }
dec() { gpg -d -o "$(basename "$1" .gpg)" "$1" }
share() { chmod 770 -R .; fd -tf -x chmod a-x {}; [ -n "$1" ] && chown :$1 -R . }
dirname() { command dirname "$@"|tilde }
sleep() { >&2 date; command sleep "$@" }
die() { rm "$@" $PWD; cd .. }
mkcd() { mkdir "$@"; while [ $# -gt 0 ]; do [ -d "$1" ] && { cd "$1"; return }; shift; done }
pkg-prepare() {
	[ -r PKGBUILD ] || return 1
	git init
	git add .
	git commit -am"init: $(bash -c '. PKGBUILD
	echo $pkgname $pkgver-$pkgrel')"
}

#   ____                      _      _   _
#  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __  ___
# | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \/ __|
# | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | \__ \
#  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|___/
#                      |_|
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} #Completion dircolors
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX)(?)*==1;32=1;35}")'
zstyle ':completion:*' rehash true #Find new executable automatically
zstyle ':completion:*' insert-tab false #Don't insert TAB char
zstyle ':completion:*' list-prompt "$(tput setaf 15)❯ $(tput sgr0)"
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' hosts off #Disable /etc/hosts lookup

compdump="$XDG_CACHE_HOME/zsh/.zcompdump"
command mkdir -p "${compdump%/*}"
[ -f $compdump ] &&
	[ $(($(date +%s)-$(date +%s -r$compdump))) -gt 86400 ] &&
		command rm "$compdump"
autoload -Uz compinit #Load completions
compinit -d "$compdump" #Auto-completion
unset compdump

#  ____                            _    __
# |  _ \ _ __ ___  _ __ ___  _ __ | |_  \ \
# | |_) | '__/ _ \| '_ ` _ \| '_ \| __|  \ \
# |  __/| | | (_) | | | | | | |_) | |_   / /
# |_|   |_|  \___/|_| |_| |_| .__/ \__| /_/____
#                           |_|          |_____|
preexec() tput sgr0
precmd() {
	prompt update
	$PROMPT_NEWLINE && echo || PROMPT_NEWLINE=true
	TRAPINT() { zle kill-whole-line; zle-update-prompt }
}
prompt() {
case "$1" in
p*) # shorten: 2=maxlength 3=pwd(debug)
	local delim='  ' cutoff='..' use='3/5'
	local pwd="${${3:-$PWD}/#$HOME/~}" full_len="${2:-$COLUMNS}"
	local max_len=$((full_len * $use))
	[ $max_len -lt $((${#delim} + ${#cutoff})) ] && pwd=''
	if [ -n "$pwd" ]; then
		local offset=$((${#pwd} - max_len + ${#cutoff} + ${#delim}))
		if [ $offset -gt 0 ]; then
			pwd="${pwd:$offset}"
			pwd="$cutoff$([[ "$pwd" == */* ]] && echo /)${pwd#*/}"
		fi
		pwd="$delim$pwd"
	fi
	echo "$pwd"
	;;
u*)
	local short_threshold=60 userhost="$PROMPT_USERHOST"
	[ $COLUMNS -le $short_threshold ] && userhost="$PROMPT_SHORTUAH"
	local pwd_length=$(( COLUMNS - ${#PROMPT_CURVES[1]} - ${#userhost} ))
	local pwd=$(prompt pwd $pwd_length)
	local curves=(╭╴ ╰─╸ "│   ")
	local git=$(2>/dev/null git branch|grep -oP '(?<=\* ).*')
	[ -z $git ] || git="%F{11}  $git"

	local sign
	[ "$EUID" -eq 0 ] && sign=#
	PS1="%B%F{15}$curves[1]%F{14}$userhost%F{13}$pwd$git
%F{15}$curves[2]$sign "
	PS2="%B%F{15}"$'\e[F'"$curves[3]
%F{15}$curves[2]$sign "
	;;
i*)
	PROMPT_NEWLINE=false
	PROMPT_USERHOST="$USER@$HOST"
	PROMPT_SHORTUAH="$USER[1]@${HOST[1]:u}"
	unset PS1
	zle_highlight=(none)
	[ -n "$SSH_CONNECTION$DOAS_USER" ] && echo
	if [[ "$(tty)" =~ tty ]]; then
		TMOUT=1200
		TRAPALRM() { exit }
		TERM=linux-16color
	fi
	;;
esac
}
prompt init
zle-update-prompt() { prompt update; zle reset-prompt }

#  _  __          ____  _           _ _
# | |/ /___ _   _| __ )(_)_ __   __| (_)_ __   __ _ ___
# | ' // _ \ | | |  _ \| | '_ \ / _` | | '_ \ / _` / __|
# | . \  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
# |_|\_\___|\__, |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
#           |___/                             |___/
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
clear-buffer() { clear; zle-update-prompt }
clear-history() {
	local i
	for i in $(seq 2 $(dirs -v|wc -l)); do popd; done
	history -p
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
	[ "$o_PWD" = "$PWD" ] || zle-update-prompt
}
cd-up()   { cd ..; zle-update-prompt }
cd-home() { cd; zle-update-prompt }
cd-copy() { echo -n "$PWD"|xclip }
cd-paste() {
	local dir="$(2>/dev/null xclip -o)"
	[ -d "$dir" ] || return
	cd "$dir" && zle-update-prompt
}
for func in delete-pure-word forward-pure-word backward-pure-word \
	clear-buffer clear-history just-exit better-accept-line \
	cd-back cd-up cd-home cd-copy cd-paste; do zle -N $func; done; unset func
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
bindkey '^[2' cd-up
bindkey '^[3' cd-home
bindkey '^[4' cd-copy
bindkey '^[5' cd-paste
bindkey '^Z' undo

# Macros
bindkey -s '\ew' '\C-a$(\C-e)'
bindkey -s '\el' '\C-e|less'
bindkey -s '\eq' '\C-e|qr'
bindkey -s '\ej' '\C-e|jq'
bindkey -s '\eg' '\C-e|grep '
bindkey -s '\ee' '\C-e|egrep '
bindkey -s '\eh' '\C-e|head '
bindkey -s '\et' '\C-e|tail '
bindkey -s '\ex' '\C-e|xargs '
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
	BUFFER="$BUFFER|while read line; do ; done"
	CURSOR=$(($#BUFFER - 6))
}
zle -N doas_
zle -N wrl_
bindkey '\ed' doas_
bindkey '\es' wrl_

#  ____                  _  __ _
# / ___| _ __   ___  ___(_)/ _(_) ___
# \___ \| '_ \ / _ \/ __| | |_| |/ __|
#  ___) | |_) |  __/ (__| |  _| | (__
# |____/| .__/ \___|\___|_|_| |_|\___|
#       |_|
[ -r "$ZSPECDIR/.zshrc" ] && . "$ZSPECDIR/.zshrc"
[ -d "$ZSPECDIR/completions" ] && for i in "$ZSPECDIR/completions"/_*; do
	. $i; done; unset i
&>/dev/null which -p pacman && . "$ZDOTDIR/modules/pacman"
&>/dev/null which -p startx && . "$ZDOTDIR/modules/xorg"

#  __  __ _              _ _
# |  \/  (_)___  ___ ___| | | __ _ _ __   ___  ___  _   _ ___
# | |\/| | / __|/ __/ _ \ | |/ _` | '_ \ / _ \/ _ \| | | / __|
# | |  | | \__ \ (_|  __/ | | (_| | | | |  __/ (_) | |_| \__ \
# |_|  |_|_|___/\___\___|_|_|\__,_|_| |_|\___|\___/ \__,_|___/
#
setopt globdots
setopt histignoredups
setopt histignorespace
setopt interactivecomments
setopt prompt_subst
setopt +o nomatch
setopt extendedglob
setopt autocd
setopt autopushd
setopt pushdsilent
tabs 2
command_not_found_handler() {
  local pkgs cmd="$1"
	&>/dev/null which -p pkgfile || echo \?
  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    echo "$cmd:"
    printf '  %s\n' $pkgs[@]
  else echo \?
  fi >&2
  return 127
}
