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
export EXA_COLORS="*.aac=36:*.alac=36:*.ape=36:*.flac=36:*.m4a=36:*.mka=36\
:*.mp3=36:*.ogg=36:*.opus=36:*.wav=36:*.wma=36:*.arw=35:*.bmp=35:*.cbr=35\
:*.cbz=35:*.cr2=35:*.dvi=35:*.eps=35:*.gif=35:*.heif=35:*.ico=35:*.jpeg=35\
:*.jpg=35:*.nef=35:*.orf=35:*.pbm=35:*.pgm=35:*.png=35:*.pnm=35:*.ppm=35\
:*.ps=35:*.raw=35:*.stl=35:*.svg=35:*.tif=35:*.tiff=35:*.webp=35:*.xpm=35\
:*.djvu=33:*.doc=33:*.docx=33:*.dvi=33:*.eml=33:*.eps=33:*.fotd=33:*.key=33\
:*.odp=33:*.odt=33:*.pdf=33:*.ppt=33:*.pptx=33:*.rtf=33:*.xls=33:*.xlsx=33\
:*.asc=32:*.enc=32:*.gpg=32:*.p12=32:*.pfx=32:*.pgp=32:*.sig=32:*.signature=32\
:*.7z=36;1:*.a=36;1:*.ar=36;1:*.bz2=36;1:*.deb=36;1:*.dmg=36;1:*.gz=36;1\
:*.iso=36;1:*.lzma=36;1:*.par=36;1:*.rar=36;1:*.rpm=36;1:*.tar=36;1:*.tc=36;1\
:*.tgz=36;1:*.txz=36;1:*.xz=36;1:*.z=36;1:*.Z=36;1:*.zip=36;1:*.zst\
:build.gradle=37;4:Cargo.toml=37;4:CMakeLists.txt=37;4:Dockerfile=37;4:Justfile=37;4:Makefile=37;4:Rakefile=37;4:SConstruct\
:or=31;4:ex=37;1:su=31;1;4:sf=31;1;4:ux=36;1;4:gx=36:tx=36:uw=35;1:gw=35:tw=35:ur=33;1:gr=33:tr=33\
:uu=33;1:gu=33;1:un=31;1:gn=31;1:ln=35;1"
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
