# Uppercase single letter aliases
mod cargo
mod git
mod pacman

# Generic
alias dn='doas nvim'
alias m='mpv --profile=music'
alias n='nvim'
alias py='python'
alias re=rename
alias v='detach mpv --profile=pseudo-gui --profile=gallery'

# Network
alias con='nmcli dev con'
alias dis='nmcli dev dis'
alias net='nmcli dev'
alias wf='nmcli dev wifi con'
alias wfls='nmcli dev wifi re; nmcli dev wifi'

# Youtube/Invidious
alias yt='ytfzf'
alias ytc='yt -cSI --sort'
alias ytr='yt -cfrom-cache'
alias yts='yt -cfrom-cache --sort'

# Graphical apps
if [ -n "$DISPLAY" ]; then
	alias kr='detach krita'
	alias lp='detach leafpad'
	alias za='detach zathura'
fi
