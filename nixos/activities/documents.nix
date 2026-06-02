{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.obsidian
    libreoffice-qt6-fresh
    # Pinning to 25.11 due to segfaults
    # https://github.com/NixOS/nixpkgs/issues/527173
    nixos2511.pinta
    gimp
    file-roller
  ];
}
