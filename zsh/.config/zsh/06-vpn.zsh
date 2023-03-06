# SblingVPN
alias sblingu="nmcli connection up sblingVPN"
alias sblingd="nmcli connection down sblingVPN"

# UNITN VPN
function unitnu() {
    if [[ -z $UNITN_USERNAME ]]; then
        echo "Please set UNITN_USERNAME environment variable."
        return 1
    fi
    if [[ ! -f $HOME/.secrets/unitn_vpn_passwd.gpg ]]; then
        echo "Please put the encrypted password in the $HOME/.secrets/unitn_vpn_passwd.gpg file."
        return 1
    fi
    if [[ -f "$HOME/.openconnect.pid" ]]; then
        echo "openconnect already running"
        return 1
    fi
    local unitn_passwd
    unitn_passwd="$(gpg --decrypt "$HOME/.secrets/unitn_vpn_passwd.gpg" 2>/dev/null)"
    sudo openconnect \
        --background \
        --pid-file="$HOME/.openconnect.pid" \
        --protocol=gp \
        --csd-wrapper=/usr/lib/openconnect/hipreport.sh \
        --user="$UNITN_USERNAME" \
        vpn.icts.unitn.it \
        --passwd-on-stdin <<< "$unitn_passwd"
}

function unitnd() {
    if [[ -f "$HOME/.openconnect.pid" ]]; then
        sudo kill -2 "$(cat "$HOME/.openconnect.pid")" && rm -f "$HOME/.openconnect.pid"
        echo "openconnect killed"
    else
        echo "openconnect pid file does not exist, probably not running"
        return 1
    fi
}
