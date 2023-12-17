mod xdg # Load first
mod options
mod theme

# Set the `PATH` variable only once.
if [ -z "$PATH_SET" ]; then
	path=(
		"$XDG_CONFIG_HOME/scripts"
		~/.local/bin
		/usr/lib/ccache/bin
		"$CARGO_HOME/bin"
		/bin
		$path
	)

	export PATH_SET=1
fi

# Sources custom environment.
[ -r "$ZSPECDIR/.zshenv" ] && . "$ZSPECDIR/.zshenv"
