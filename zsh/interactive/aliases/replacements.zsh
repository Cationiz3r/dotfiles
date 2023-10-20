alias less="$PAGER"
alias bat='bat --tabs 2'
alias time='command time -p'
alias shred='shred -vu --random-source=/dev/urandom'
alias ps='ps aux'
alias speedtest='speedtest --secure --bytes'
alias sleep='date "+[%Y-%m-%d %H:%M:%S] sleep"; sleep'
alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'

# Wget aliases
local wget_alias='wget -c --show-progress --hsts-file /dev/null'
alias wget="$wget_alias"
alias twget="torsocks $wget_alias"

# Sort disk free content results
df() {
	local out=$(command df -h "$@")
	echo "$out"|head -1
	echo "$out"|tail +2|sort
}

# List size of direct files/dirs in args and display in table
du() {
	command du -ahd1 --apparent-size "$@"|
	sort -h|
	sed 's:\t\./:\t:'|
	column -ts$'\t'
}
