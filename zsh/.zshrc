#!/bin/zsh

# Load modules for interactive shell
source "$ZDOTDIR/interactive/aliases.zsh"
source "$ZDOTDIR/interactive/completions.zsh"
source "$ZDOTDIR/interactive/key_bindings.zsh"
source "$ZDOTDIR/interactive/misc.zsh"
source "$ZDOTDIR/interactive/prompt.zsh"
source "$ZDOTDIR/interactive/options.zsh"
source "$ZDOTDIR/interactive/specific.zsh"

# Reformat text when shell is not loaded
echo -ne '\r'
