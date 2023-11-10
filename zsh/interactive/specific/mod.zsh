[ -r "$ZSPECDIR/.zshrc" ] && . "$ZSPECDIR/.zshrc"
[ -d "$ZSPECDIR/completions" ] && for i in "$ZSPECDIR/completions"/_*; do
	. $i; done; unset i
