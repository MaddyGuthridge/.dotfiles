{ config, pkgs, ... }:
{
  # dictionary
  environment.etc."dict.conf".text = "server dict.org";
  # Word list
  environment.wordlist.enable = true;

  environment.systemPackages = with pkgs; [
    obsidian
    libreoffice-qt6-fresh
    pinta
    gimp
    inkscape
    krita
    file-roller
    pandoc
    ghostscript
    dict
  ];
}
