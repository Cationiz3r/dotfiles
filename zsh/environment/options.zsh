# Applications options.
## Default applications.
export BROWSER='librewolf-xdg'
export EDITOR='nvim'
export PAGER='less'
## Default options for `less`.
export LESS="-FRiNx2Maj20#2"
## Overrides pager for a few applications to hide the number column in `less`.
export BAT_PAGER='less -n'
export MANPAGER='less -n'
## Fixes gpg not infering the current tty.
export GPG_TTY=$(tty)
## Uses pipenv in current dir instead of a centralized directory.
export PIPENV_VENV_IN_PROJECT=1
## Fixes steam client blank/white rendering on NVIDIA driver.
## https://github.com/ValveSoftware/steam-for-linux/issues/9306
export QT_X11_NO_MITSHM=1
# Defines vars needed for ibus.
export GTK_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
export QT_IM_MODULE='ibus'

# X11 launch options.
## Explicit configuration file for xinitrc to launch picom with.
export PICOM_CONF="$XDG_CONFIG_HOME/picom/picom.conf"

# Zsh options.
## Disables global history.
unset HISTFILE
## Longer history size
HISTSIZE=2000

# Locales.
export LANG='en_US.UTF-8'
export LC_TIME='en_GB.UTF-8'
export LC_PAPER='en_GB.UTF-8'
export LC_MEASUREMENT='en_GB.UTF-8'
export LC_COLLATE=C

# Sytem options.
## Privatizes all created files and directories.
umask 0077
