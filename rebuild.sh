#!/usr/bin/env bash
# rebuild.sh
# Rebuild NixOS from this configuration
#
# Args are passed to `nh os switch`
set -euo pipefail

sudo cp -r ./nixos/* /etc/nixos

# -f  =>  use whatever channel is configured for "nixos"
# -a  =>  prompt for confirmation
# -t  =>  show traces
# $@  =>  additional args
nh os switch -f '<nixpkgs/nixos>' -a -t "$@"
