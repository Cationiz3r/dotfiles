alias path='tr : \\n <<<$PATH'
alias pubip='curl https://ifconfig.me && echo'
alias now='date +%y%m%d_%H%M%S'
alias printq='printf "%q\n"'
alias count='sort|uniq -c|sort -n'
alias webcam='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'

# Pipe lines of equations to find sum of them
sum() { { tr '\n' +; echo 0 }|bc -l }

# Pipe/pass argument for qrcode generation
qr() { tput setaf 15; qrencode -tUTF8 "$@" }

# Count number of lines for file matching expression
lc() { fd -tf "$@" -X wc -l|sort -n }

# Simple symmetric gpg encrypt/decrypt functions
enc() {
	gpg \
		--symmetric \
		--no-symkey-cache \
		--cipher-algo AES256 \
		--output "$(basename "$1").gpg" \
		"$1"
}
dec() { gpg --decrypt --output "$(basename "$1" .gpg)" "$1" }

# Grant group read/write access for current pwd
# and change group name if specified
share() {
	fd -tf -x chmod g+rw  {}
	fd -td -x chmod g+rwx {}
	chmod g+rwx . # fd doesn't include current dir
	if [ -n "$1" ] && grep -qE "^$1:" /etc/group; then
		chown ":$1" -R .
	else
		echo "warning: sharing self-group"
	fi
}

# Remove current dir and back out
die() { rm "$@" "$PWD"; cd .. }

# Make a directory and move into it
mkcd() { mkdir "$1"; [ -d "$1" ] && cd "$1" }
