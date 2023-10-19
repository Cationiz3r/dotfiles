#!/bin/zsh

mod inputrc # Load first
mod external
mod function
mod macro

# Unbind
bindkey -r '^s'
bindkey -r '^r'
bindkey -r '^[^L'
