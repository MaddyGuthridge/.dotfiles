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

# Rollback nix-channel to currently-running version
# https://discourse.nixos.org/t/how-to-roll-back-channel-to-currently-active-version/43161/3
rollback: copy-config
    sudo nix-channel --rollback "$(grep --fixed-strings --files-with-matches "$(cut --delimiter=. --fields=3 /run/current-system/nixos-version)" /nix/var/nix/profiles/per-user/root/channels-*-link/nixos/svn-revision | tail --lines=1 | cut --delimiter=- --fields=3)"

# Repair the nix store if things break
repair:
    sudo nix-store --verify --check-contents --repair

# Update tools installed using mise
mise-update:
    MISE_GITHUB_TOKEN=$(gh auth token) mise upgrade
