#!/bin/zsh

# Base directories
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"

## Applications
export XAUTHORITY="$XDG_RUNTIME_DIR/xorg/auth"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export PYTHONPYCACHEPREFIX="$XDG_RUNTIME_DIR/pycache"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android"
export _JAVA_OPTIONS="$_JAVA_OPTIONS \
-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MAKEPKG_CONF="$XDG_CONFIG_HOME/makepkg.conf"
export MYSQL_HISTFILE="$XDG_RUNTIME_DIR/mysql"
export UNISON="$XDG_DATA_HOME/unison"
export DIRCOLORS="$XDG_CONFIG_HOME/dircolors"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# X11 logfile
XLOG="$XDG_RUNTIME_DIR/xorg/$XDG_VTNR"

# Specific dir
export ZSPECDIR="$XDG_CONFIG_HOME/zsh-spec"
