#!/bin/zsh

# FZF options
export FZF_DEFAULT_OPTS="--color=\
fg:#c7c7c7,bg:#111111,hl:#8f8f8f,\
fg+:#f0f0f0,bg+:#111111,hl+:#a6a6a6,\
info:#d6d6d6,prompt:#efefef,pointer:#ffffff,\
marker:#999999,spinner:#a5a5a5,header:#ffffff \
--prompt='  ' --pointer='❯'"

# Java theme unification
export _JAVA_OPTIONS="\
-Dawt.useSystemAAFontSettings=on \
-Dswing.aatext=true \
-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel \
-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

# Grep color
export GREP_COLORS='ms=1;97:mc=1;97:ln=1;95'

# QT theme
export QT_AUTO_SCREEN_SCALE_FACTOR=0 # Disable appimage scaling
export QT_STYLE_OVERRIDE=gtk2 # Theme unification with GTK
export QT_QPA_PLATFORMTHEME=gtk2

# Extra exa colors
export EXA_COLORS="\
su=01;04;31:sf=01;04;31:\
ur=01;33:uw=01;35:ux=01;04;37:\
gr=00;33:gw=00;35:gx=01;04;37:\
tr=00;33:tw=00;35:tx=01;04;37:\
uu=01;33:gu=01;33:un=01;31:gn=01;31"

# bat replaces cat for viewing files
export BAT_THEME='ansi'
