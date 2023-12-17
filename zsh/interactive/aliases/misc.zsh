# Spawn background processes
detach() { nohup "$@" &>/dev/null &| }
if [ -n "$DISPLAY" ]; then
	detach() { nohup "$@" &>>"$XLOG" &| }
fi

# Less verbose ffmpeg commands
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# Colorize commands' output
alias diff='diff --color=auto -uT --palette "hd=34;1:rs=95;1:de=91;2:ad=97;1"'
alias grep='grep --color=auto'
alias pactree='pactree -c'

# Clear sqlite output
alias sql3='sqlite3 -noheader -list'
