export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export DOTFILES=$HOME/.dotfiles

# Config files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History files
export _Z_DATA="$XDG_STATE_HOME/z"
export GDBHISTFILE="$XDG_STATE_HOME/gdb_history"
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"

# Data files
export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WINEPREFIX="$XDG_DATA_HOME/wine"

# Cache files
export ZSH_COMPDUMP="$XDG_CACHE_HOME"/zsh/zcompdump
