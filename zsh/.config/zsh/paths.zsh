export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/.dotfiles
export ZSH_COMPDUMP=$HOME/.cache/zcompdump-$SHORT_HOST-$ZSH_VERSION

REPOS_LPC=/mnt/sdb3/repos/
REPOS_PC=/mnt/d/repos/
# REPOS_LT=
# REPOS_MAC=

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

export REPOS
