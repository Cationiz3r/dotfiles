which -p cargo &>/dev/null || return 1

local key=C
alias "$key"='cargo'

declare -A aliases
aliases=(
	[a]=' add'
	[b]=' build'
	[c]=' check'
	[cl]=' clean'
	[d]=' doc'
	[f]=' fmt'
	[i]=' init'
	[l]=' clippy' # lint
	[r]=' run'
	[rm]=' remove'
	[t]=' test'
)

local shortcut expanded
for shortcut expanded in ${(kv)aliases}; do
	alias "$key$shortcut"="$key$expanded"
done
