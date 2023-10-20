eval "$(dircolors "$DIRCOLORS")"
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
