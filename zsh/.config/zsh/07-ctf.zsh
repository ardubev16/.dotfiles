export CTF=$HOME/CTF
pathPrepend "$CTF/00-tools/scripts"

# GDB
alias gdb-pwndbg="gdb -q -ex init-pwndbg"
alias gdb-gef="gdb -q -ex init-gef"

# docker containers
alias ctf-stego="docker run --rm -itv \$PWD:/data -p 6901:6901 dominicbreuker/stego-toolkit /bin/bash"
alias yafu="docker run --rm -it eyjhb/yafu -threads 4"

# docker container for ilspy
ilspy() {
    docker run --rm -itv "$PWD":/ilspy bannsec/ilspy_docker /bin/sh -c "cd /ilspy && ilspycmd  $*";
}

# start python script on a socket
ctf-server() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: ctf-server <port> <script>"
        return 1
    fi

    socat -d TCP-LISTEN:"$1",reuseaddr,fork EXEC:"timeout -k 5 30 python3 -u $2"
}
