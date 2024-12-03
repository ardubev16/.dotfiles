function pathPrepend() {
    # Only adds to the path if it's not already there
    if ! echo "$PATH" | grep -E -q "(^|:)$1($|:)"; then
        PATH=$1:$PATH
    fi
}

function pathAppend() {
    # Only adds to the path if it's not already there
    if ! echo "$PATH" | grep -E -q "(^|:)$1($|:)"; then
        PATH=$PATH:$1
    fi
}

function setwp() {
    nitrogen --set-auto --save --head="${2-0}" "$1"
}

function ftpsrv() {
    if [ "$1" = "" ]; then
        echo "Usage: ftpsrv <ip>"
        return 1
    fi
    docker run --rm -it -v "$PWD":/home/vsftpd/admin --net host --name vsftpd -e FTP_PASS=password -e PASV_ADDRESS="$1" fauria/vsftpd
}
