export ZDOTDIR=$HOME/.config/zsh
export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/.dotfiles
export CTF=$HOME/CTF

export ZSH_COMPDUMP=$HOME/.cache/zsh/zcompdump-$HOST


pathPrepend() {
    # Only adds to the path if it's not already there
    if ! echo $PATH | egrep -q "(^|:)$1($|:)"; then
        PATH=$1:$PATH
    fi
}

pathPrepend "$CTF/00-tools/scripts"

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
