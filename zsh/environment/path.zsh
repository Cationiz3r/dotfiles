#!/bin/zsh

typeset -U path PATH
if [ -z "$PATH_SET" ]; then
	path=(
		/usr/lib/ccache/bin
		"$XDG_CONFIG_HOME"/scripts
		~/.local/bin
		~/.local/bin-firejail
		"$CARGO_HOME"/bin
		/bin
		$path
	)

	export PATH_SET=1
fi
