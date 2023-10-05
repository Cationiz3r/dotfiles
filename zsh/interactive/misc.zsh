#!/bin/zsh

command_not_found_handler() {
  local pkgs cmd="$1"
	&>/dev/null which -p pkgfile || echo \?
  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    echo "$cmd:"
    printf '  %s\n' $pkgs[@]
  else echo \?
  fi >&2
  return 127
}

# Disable pausing/resuming terminal
stty -ixon

# Few completions
_detach() {
	local cmd="$words[1]"
	local cpp='_comp_priv_prefix=( $cmd -n ${(kv)opt_args[(I)-u]} )'
	_arguments \
		"(-)1: :{ $cpp; _command_names -e }" \
		"*:: :{ $cpp; _normal }"
}
compdef _detach detach

_x() {
	&>/dev/null xset q || return
	compadd \
		$(cut -d: -f1 /etc/passwd|awk '{print "+" $0}') \
		$(xhost|tail +2|cut -d: -f3|awk '{print "-" $0}')
}
compdef _x x
