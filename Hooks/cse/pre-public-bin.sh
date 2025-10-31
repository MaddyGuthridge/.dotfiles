#!/usr/bin/env bash

set -euo pipefail

dotfiles=$(realpath "$(dirname $BASH_SOURCE)/../..")
cd $dotfiles

# Make bin scripts public
chmod 755 Configs/cse Configs/cse/bin Configs/cse/bin/*
