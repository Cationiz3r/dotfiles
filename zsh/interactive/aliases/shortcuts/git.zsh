which -p git &>/dev/null || return 1

local key=G
alias "$key"='git'

declare -A aliases
aliases=(
	[a]=' add'
	[am]=' merge --abort'
	[ap]='pk --abort'
	[ar]='r --abort'
	[b]=" branch \
--sort=-committerdate \
--format='%(color:bold blue)%(HEAD) \
%(color:bold brightred)%(refname:short)%(color:reset) \
%(color:bold green)(%(committerdate:relative))%(color:reset) \
%(color:bold brightwhite)%(contents:subject)%(color:reset) \
%(color:dim white)- %(authorname)%(color:reset)'"
	[ba]='b -a'
	[bs]=' bisect'
	[c]=' commit -m'
	[ca]=' commit --amend'
	[cb]='co -b'
	[cc]=' rev-list --count HEAD'
	[ch]='co HEAD --'
	[cl]=' clone'
	[cm]=' merge --continue'
	[co]=' checkout'
	[cp]='pk --continue'
	[cr]='r --continue'
	[ct]=' shortlog -sen'
	[d]='dd --staged'
	[dc]='ds --staged'
	[dd]=' diff --color-words'
	[del]=' branch -D'
	[ds]=' diff --stat=$((COLUMNS - 8))'
	[e]=' remote -v'
	[f]=' fetch'
	[fa]='f --all'
	[fg]=' reset --hard'
	[fp]=' fa --prune'
	[i]=' init'
	[l]='ll --max-count=20'
	[la]='l --all'
	[lb]='l --branches'
	[lf]='llf --max-count=20'
	[ll]=" log --graph \
--abbrev-commit \
--decorate \
--date=format-local:'%y/%m/%d %H:%M' \
--format=format:'%C(bold black blue) %h \
%C(reset)%C(green) %ad\
%C(reset)%C(bold brightwhite) %s \
%C(reset)%C(dim white)- %an \
%C(reset)%C(bold italic brightred)%D'"
	[lla]='ll --all'
	[llb]='ll --branches'
	[llf]='ll --first-parent'
	[ls]=' ls-tree -r --name-only HEAD'
	[m]=' merge -m'
	[p]=' push'
	[pa]='p --all'
	[pk]=' cherry-pick'
	[pl]=' pull'
	[pp]='pa --prune'
	[r]='re -i'
	[re]=' rebase'
	[root]=' rev-parse --show-toplevel'
	[rs]=' restore --staged'
	[s]=' status -sb'
	[ss]='s .'
	[st]=' show --stat=$((COLUMNS - 8))'
	[sw]=' show --color-words'
	[t]=' tag'
	[ud]=' reset --soft HEAD~1'
	[z]=' stash'
	[za]='z apply'
	[zd]='z drop'
	[zk]='z save -km'
	[zl]='z list'
	[zm]='z save -m'
	[zt]='z show --stat=$((COLUMNS - 8))'
	[zw]='z show --color-words'
	[zz]='z pop'
)

local shortcut expanded
for shortcut expanded in ${(kv)aliases}; do
	alias "$key$shortcut"="$key$expanded"
done
