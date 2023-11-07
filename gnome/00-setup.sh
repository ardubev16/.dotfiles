#!/usr/bin/env bash

set -e

BASE_PATH=$(dirname "$(realpath "$0")")

. "$BASE_PATH"/01-install_ext.sh
. "$BASE_PATH"/02-keybindings.sh
. "$BASE_PATH"/03-extensions.sh
. "$BASE_PATH"/04-misc.sh
