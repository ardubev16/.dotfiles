REPOS_LPC=/mnt/sdb3/repos/
REPOS_PC=/mnt/d/repos/
# REPOS_LT=
# REPOS_MAC=

case $(hostname) in
    "ARDU-LPC")
        REPOS=$REPOS_LPC
        ;;
    "ARDU-PC")
        REPOS=$REPOS_PC
        ;;
    # "ARDU-LT")
    #     REPOS=$REPOS_LT
    #     ;;
    *)
        REPOS=$HOME/repos
        ;;
esac

export REPOS
