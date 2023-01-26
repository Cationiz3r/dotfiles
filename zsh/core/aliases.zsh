#!/bin/zsh

alias \
	ls='exa -ag --group-directories-first' \
	ll='ls -l' \
	la='ll -a' \
	l='ls -D' \
	lm='ls -snewest' \
	ld='ll -ssize' \
	lo='ls -soldest' \
	cp='cp -ivr' \
	mv='mv -iv' \
	rm='rm -vr' \
	ln='ln -v' \
	mkdir='mkdir -vp' \
	rmdir='rmdir -v' \
	rename='rename -v' \
	re=rename \
	sed='sed -E' \
	gzip='gzip -v' \
	py='python' \
	path='tr : \\n <<<$PATH' \
	refresh='. $ZDOTDIR/.zshenv; . $ZDOTDIR/.zshrc' \
	grep='grep --color=auto' \
	egrep='egrep --color=auto' \
	fgrep='fgrep --color=auto' \
	pactree='pactree -c' \
	diff='diff --color=auto -uT --palette "hd=34;1:rs=95;1:de=91;2:ad=97;1"' \
	less='less -FRx2' \
	ffmpeg='ffmpeg -hide_banner' \
	ffprobe='ffprobe -hide_banner' \
	time='command time -p' \
	btop='btop +t' \
	wget='wget -c --show-progress --hsts-file /dev/null' \
	xargs='xargs -t' \
	fd='fd -uu' \
	bat='bat --tabs 2' \
	shred='shred -vu --random-source=/dev/urandom' \
	ps='ps aux' \
	play='mpv --profile=music' \
	yd3='yt-dlp -xfba --audio-format mp3' \
	yd4='yt-dlp -f"bv*[height<=480]+ba/b[height<=480]/wv*+ba/w"' \
	xpcn='xprop _NET_WM_PID WM_CLASS WM_NAME _OB_APP_CLASS _OB_APP_NAME _OB_APP_TYPE _OB_APP_TITLE _OB_APP_ROLE' \
	netspeed='speedtest --secure --bytes' \
	pubip='curl https://ifconfig.me && echo' \
	now='date +%y%m%d_%H%M%S' \
	printq='printf "%q\n"' \
	cenv='env -i TERM="$TERM" USER=clear LANG="$LANG" HISTFILE=' \
	sleep='date "+[%Y-%m-%d %H:%M:%S] sleep"; sleep' \
	g='git' \
	count='sort|uniq -c|sort -n'

df() { command df -h|head -1; command df -hxdevtmpfs "$@"|tail +2|sort }
du() { command du -ahd1 --apparent-size "$@"|sort -h|sed 's:\./::'|column -ts$'\t' }
qr() { echo $'\e[1;37m'"$(qrencode -tUTF8 "$@")"$'\e[0m' }
enc() { gpg -c --no-symkey-cache --cipher-algo AES256 -o "$(basename "$1").gpg" "$1" }
dec() { gpg -d -o "$(basename "$1" .gpg)" "$1" }
share() { chmod 770 -R .; fd -tf -x chmod a-x {}; [ -n "$1" ] && chown :$1 -R . }
die() { rm "$@" $PWD; cd .. }
mkcd() { mkdir "$@"; while [ $# -gt 0 ]; do [ -d "$1" ] && { cd "$1"; return }; shift; done }
spawn() { sh -c "$* &" &>>$XLOG }
