#!/bin/zsh

module="/usr/share/zsh/plugins/zsh-history-substring-search/\
zsh-history-substring-search.zsh"
if [ -r "$module" ]; then
	source "$module"
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=
	HISTORY_SUBSTRING_SEARCH_FUZZY=true
	HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
else
	echo "warn: history substring search disabled" >&2
fi
unset module
