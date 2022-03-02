STOW_FOLDERS="bin,git,tmux,nvim,zsh"

REPOS_LPC=/mnt/sdb3/repos/
REPOS_PC=/mnt/d/repos/
# REPOS_LT=
# REPOS_MAC=
STOW_LPC="alacritty,autostart,plank,ulauncher"
STOW_PC=""
# STOW_LT=
# STOW_MAC=

case $(hostname) in
    "ARDU-LPC")
        REPOS=$REPOS_LPC
        STOW_FOLDERS="$STOW_FOLDERS,$STOW_LPC"
        ;;
    "ARDU-PC")
        REPOS=$REPOS_PC
        STOW_FOLDERS="$STOW_FOLDERS,$STOW_PC"
        ;;
    # "ARDU-LT")
    #     REPOS=$REPOS_LT
    #     ;;
    *)
        REPOS=$HOME/repos
        ;;
esac

export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/.dotfiles
export REPOS
export STOW_FOLDERS

