# Justfile contains commands for building NixOS

default:
    just --list

copy-config:
    sudo cp -r ./nixos/* /etc/nixos

rebuild: copy-config
    # -f  =>  use whatever channel is configured for "nixos"
    # -a  =>  prompt for confirmation
    # -t  =>  show traces
    # $@  =>  additional args
    nh os switch -f '<nixpkgs/nixos>' -a -t

update: && rebuild
    nix-channel --update
