export EDITOR='nvim'
export PAGER='less'
export BAT_PAGER='less -n'
export MANPAGER='less -n'
export LESS="-FRiNx2Ma20#2"
local hist_dir="$XDG_RUNTIME_DIR/hist"
mkdir -p "$hist_dir"
export LESSHISTFILE="$hist_dir/less"
export SQLITE_HISTORY="$hist_dir/sqlite"
export GPG_TTY=$(tty)

# For xinitrc
export PICOM_CONF="$HOME/.config/picom/picom.conf"

# Local history only
unset HISTFILE # No history
HISTSIZE=2048

# Use pipenv in current dir as the project dir
export PIPENV_VENV_IN_PROJECT=1

# Fix steam client blank/white rendering on NVIDIA driver
# https://github.com/ValveSoftware/steam-for-linux/issues/9306
export QT_X11_NO_MITSHM=1

# No share
umask 0077
