# Base directories
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"

# Applications
## Cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"
export MYSQL_HISTFILE="$XDG_CACHE_HOME/mysql"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/pycache"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite"

## Config
export _JAVA_OPTIONS="\
-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export DIRCOLORS="$XDG_CONFIG_HOME/dircolors"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export MAKEPKG_CONF="$XDG_CONFIG_HOME/makepkg.conf"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"

## Data
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export UNISON="$XDG_DATA_HOME/unison"

## Runtime
export XLOG="$XDG_RUNTIME_DIR/xorg/${XDG_VTNR:-unknown}" # Logs background jobs
export XAUTHORITY="$XDG_RUNTIME_DIR/xorg/auth"

# Machine/User specific directory
export ZSPECDIR="$XDG_CONFIG_HOME/zsh-spec"
