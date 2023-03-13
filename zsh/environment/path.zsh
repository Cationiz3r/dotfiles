#!/bin/zsh

typeset -U path PATH
path=(
	/usr/lib/ccache/bin
	"$XDG_CONFIG_HOME"/scripts
	~/.local/bin
	~/.local/bin-firejail
	/bin
	$path
)
