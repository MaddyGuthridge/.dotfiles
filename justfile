# Justfile contains commands for building NixOS

default:
    just --list

copy-config:
    sudo cp -r ./nixos/* /etc/nixos

# Rebuild NixOS using the updated config
rebuild: copy-config
    # -f  =>  use whatever channel is configured for "nixos"
    # -a  =>  prompt for confirmation
    # -t  =>  show traces
    nh os switch -f '<nixpkgs/nixos>' -a -t

# Update nix-channel both for root and for my user
update: && rebuild mise-update
    nix-channel --update
    sudo nix-channel --update

# Repair the nix store if things break
repair:
    sudo nix-store --verify --check-contents --repair

# Update tools installed using mise
mise-update:
    mise upgrade
