which -p pacman &>/dev/null || return 1

# Get privilege escalator program
local up=
if which -p doas &>/dev/null; then
	up=doas
elif which -p sudo &>/dev/null; then
	up=sudo
elif [ $EUID -eq 0 ]; then
	# Do nothing
else
	up=nope
fi

alias P='pacman'
alias Pi='Pq -i'
alias Pl='Pq -l'
alias Pq='P -Q'
alias Pqm='Pq -me'
alias Pqn='Pq -ne'
alias Pss="P -Ss"

if ! [ "$up" = 'nope' ]; then
	alias _P="$up pacman"
	alias Pde='_P -D --asexplicit'
	alias Pdp='_P -D --asdeps'
	alias Pf='_P -S'
	alias Pr='_P -Rs'
	alias Ps='Pf --needed'
	alias Psd='Ps --asdeps'
	alias Pu='_P -U'
	alias Py='Pf -yu --noconfirm'
fi

# Remove orphaned packages
Pro() {
	local pkgs=($(pacman -Qdtq))
	[ $#pkgs -eq 0 ] && return
	echo "packages: $(tput bold)$pkgs$(tput sgr0)"
	Pr $pkgs
}

# Custom alias for yay
which -p yay &>/dev/null || return 1

alias Pa='yay -Syua'
alias Pas='yay -Ss'
alias Pai='yay -Si'
