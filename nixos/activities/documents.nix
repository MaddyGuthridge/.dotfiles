{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.obsidian
    libreoffice-qt6-fresh
    pinta
  ];
}
