pathPrepend() {
    # Only adds to the path if it's not already there
    if ! echo $PATH | egrep -q "(^|:)$1($|:)"; then
        PATH=$1:$PATH
    fi
}

pathAppend() {
    # Only adds to the path if it's not already there
    if ! echo $PATH | egrep -q "(^|:)$1($|:)"; then
        PATH=$PATH:$1
    fi
}

