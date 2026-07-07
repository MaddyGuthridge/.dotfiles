# Justfile contains commands for building NixOS

default:
    just --list

copy-config:
    sudo cp -r ./nixos/* /etc/nixos

# Rebuild NixOS and switch to the new generation
switch: copy-config
    # -f  =>  use whatever channel is configured for "nixos"
    # -a  =>  prompt for confirmation
    # -t  =>  show traces
    nh os switch -f '<nixpkgs/nixos>' -a -t

# Rebuild NixOS using the updated config
rebuild: copy-config
    # -f  =>  use whatever channel is configured for "nixos"
    # -t  =>  show traces
    nh os boot -f '<nixpkgs/nixos>' -t

# Update nix-channel both for root and for my user
update: && mise-update
    sudo nix-channel --update
    nix-channel --update
    # -f  =>  use whatever channel is configured for "nixos"
    # -a  =>  prompt for confirmation
    # -t  =>  show traces
    nh os boot -f '<nixpkgs/nixos>' -a -t

# Repair the nix store if things break
repair:
    sudo nix-store --verify --check-contents --repair

# Update tools installed using mise
mise-update:
    MISE_GITHUB_TOKEN=$(gh auth token) mise upgrade
