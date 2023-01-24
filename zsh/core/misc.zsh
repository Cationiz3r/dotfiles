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
stty -ixon
echo -ne '\r' #clear early text
