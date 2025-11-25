#!/usr/bin/env bash
# rebuild.sh
# Rebuild NixOS from this configuration
set -euo pipefail

sudo cp -r ./nixos/* /etc/nixos
sudo time -f "Done in %e seconds" nixos-rebuild switch --show-trace
