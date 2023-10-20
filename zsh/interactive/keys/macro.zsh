# Append to end
bindkey -s '\ew' '\C-a$(\C-e)'
bindkey -s '\el' '\C-e|less'
bindkey -s '\eq' '\C-e|count'
bindkey -s '\ej' '\C-e|jq'
bindkey -s '\eJ' '\C-e|jq -C|less'
bindkey -s '\eg' '\C-e|grep '
bindkey -s '\ee' '\C-e|grep -E'
bindkey -s '\eh' '\C-e|head '
bindkey -s '\et' '\C-e|tail '
bindkey -s '\ex' '\C-e|xargs '
bindkey -s '\es' '\C-e|sed '
bindkey -s '\er' '{,}'

# TUI app launcher
widget_launcher() {
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
}
zle -N widget_launcher
bindkey '\ec' widget_launcher
bindkey '\ev' widget_launcher
bindkey '\eb' widget_launcher
bindkey '\en' widget_launcher

# Macros that update cursor position
doas_() { BUFFER="doas $BUFFER"; CURSOR+=5 }
wrl_() {
	BUFFER="$BUFFER|while read l; do ; done"
	CURSOR=$(($#BUFFER - 6))
}
zle -N doas_
zle -N wrl_
bindkey '\ed' doas_
bindkey '\ea' wrl_
