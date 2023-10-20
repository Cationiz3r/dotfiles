local up=doas
which doas &>/dev/null || up=sudo
[ $EUID -eq 0 ] && up=
[ -z $up ] || up="$up "

alias \
	pY="${up}pacman -Syu --noconfirm" \
	pU="${up}pacman -U" \
	pS="${up}pacman -S" \
	pR="${up}pacman -Rs" \

pRO() {
	local pkgs=($(pacman -Qdtq))
	[ $#pkgs -eq 0 ] && return
	echo "packages: $(tput bold)$pkgs$(tput sgr0)"
	pR $pkgs
}

_pS() {
	local state line packages=(--needed --asdeps)
	_arguments '*:: :->args'
	[[ "$line[$#line[@]]" =~ ^- ]] || packages=($(pacman -Slq))
	compadd "$@" -a packages
}
_pR() { local packages=($(pacman -Qq)); compadd "$@" -a packages }
compdef '_files -g *.pkg.tar.(zst|xz)' pU
compdef _pS pS
compdef _pR pR
