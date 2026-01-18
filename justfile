# Justfile contains commands for building NixOS

default:
    just --list

copy-config:
    sudo cp -r ./nixos/* /etc/nixos

# -f  =>  use whatever channel is configured for "nixos"
# -a  =>  prompt for confirmation
# -t  =>  show traces
rebuild: copy-config
    nh os switch -f '<nixpkgs/nixos>' -a -t

update: && rebuild
    # Update nix-channel both for root and for my user
    nix-channel --update
    sudo nix-channel --update
