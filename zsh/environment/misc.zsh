#!/bin/zsh

export EDITOR='nvim'
export PAGER='less -FRx2'
export LESSHISTFILE=- # No less history
export GPG_TTY=$(tty)

# For xinitrc
export PICOM_CONF="$HOME/.config/picom/picom.conf"

# Local history only
unset HISTFILE # No history
HISTSIZE=200

# No share
umask 0077
