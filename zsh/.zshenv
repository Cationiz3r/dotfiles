#!/bin/zsh
#	           _
#	   _______| |__   ___ _ ____   __
#	  |_  / __| '_ \ / _ \ '_ \ \ / /
#	 _ / /\__ \ | | |  __/ | | \ V /
#	(_)___|___/_| |_|\___|_| |_|\_/
#

typeset -U PATH="/usr/lib/ccache/bin:$HOME/.local/bin:$HOME/.local/bin-firejail:$HOME/.bin:/bin:$PATH"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export FZF_DEFAULT_OPTS="--color=fg:#c7c7c7,bg:#151515,hl:#8f8f8f \
--color=fg+:#f0f0f0,bg+:#151515,hl+:#a6a6a6 \
--color=info:#d6d6d6,prompt:#efefef,pointer:#ffffff \
--color=marker:#999999,spinner:#a5a5a5,header:#ffffff \
--prompt='  ' --pointer='❯'"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true \
-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel \
-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" # Java theme unification
export EDITOR='vim'
export PAGER='less -FRx2'
export GREP_COLORS='ms=1;97:mc=1;97:ln=1;95' # Grep color
export QT_AUTO_SCREEN_SCALE_FACTOR=0 # Disable appimage scaling
export QT_STYLE_OVERRIDE=gtk2 #Qt theme unification
export QT_QPA_PLATFORMTHEME=gtk2
export LESSHISTFILE=- # No less history
export BAT_THEME='ansi'
export EXA_COLORS="\
su=01;04;31:sf=01;04;31:\
ur=01;33:uw=01;35:ux=01;04;37:\
gr=00;33:gw=00;35:gx=01;04;37:\
tr=00;33:tw=00;35:tx=01;04;37:\
uu=01;33:gu=01;33:un=01;31:gn=01;31"
export LANG="${LANG:-en_US.UTF-8}" #Default locale
export GPG_TTY=$(tty)
export PICOM_CONF="$HOME/.config/picom/picom.conf"
unset HISTFILE # No history
# XDG Decluttering
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSPECDIR="$XDG_CONFIG_HOME/zsh-spec"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export PYTHONPYCACHEPREFIX="$XDG_RUNTIME_DIR/pycache"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android"
export _JAVA_OPTIONS="$_JAVA_OPTIONS \
-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MAKEPKG_CONF="$XDG_CONFIG_HOME/makepkg.conf"
export MYSQL_HISTFILE="$XDG_RUNTIME_DIR/mysql"
export UNISON="$XDG_DATA_HOME/unison"
export DIRCOLORS="$XDG_CONFIG_HOME/dircolors"
# Locales
export LANG="en_US.UTF-8"
export LC_TIME="en_GB.UTF-8"
export LC_PAPER="en_GB.UTF-8"
export LC_MEASUREMENT="en_GB.UTF-8"
export LC_COLLATE=C
umask 0077
HISTSIZE=200
XLOG="$XDG_RUNTIME_DIR/Xorg/$XDG_VTNR"

[ -r "$ZSPECDIR/.zshenv" ] &&
	source "$ZSPECDIR/.zshenv"
