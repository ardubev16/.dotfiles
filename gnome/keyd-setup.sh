#!/usr/bin/env bash

set -e

BASE_PATH=$(dirname "$(realpath "$0")")

sudo cp -r "$BASE_PATH/keyd" /etc
sudo systemctl enable keyd
sudo systemctl start keyd
