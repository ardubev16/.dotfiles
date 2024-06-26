# XDG directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export DOTFILES=$HOME/.dotfiles
export REPOS=$HOME/Repos

# Config files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# History files
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
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Editor
VIM="nvim"
export EDITOR=$VIM
export VISUAL=$VIM
export GIT_EDITOR=$VIM

# Fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ -f "$HOME/.env" ]]; then
  source "$HOME/.env"
fi
