# Replace ls with eza
alias ls='eza -ag --group-directories-first'
alias ll='ls -l'
alias la='ll -a'
alias l='ls -D'
alias lm='ls -snewest'

# Make commands verbase and/or interactive
alias cp='cp -ivr'
alias mv='mv -iv'
alias rm='rm -vr'
alias ln='ln -v'
alias mkdir='mkdir -vp'
alias rmdir='rmdir -v'
alias rename='rename -v'

alias gzip='gzip -v'
alias fd='fd -uu'
