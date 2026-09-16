{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Force Electron 40 for Obsidian, since Harper plugin causes a crash.
    # https://github.com/NixOS/nixpkgs/issues/539153
    (obsidian.override { electron = pkgs.electron_40; })
    libreoffice-qt6-fresh
    pinta
    gimp
    inkscape
    krita
    file-roller
    pandoc
    ghostscript
  ];
}
