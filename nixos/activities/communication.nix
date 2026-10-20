{ config, pkgs, ... }:
let
  zenBrowser = builtins.getFlake "github:0xc000022070/zen-browser-flake";
in
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    thunderbird-esr
    unstable.teams-for-linux
    unstable.discord
    slack
    zoom-us
    signal-desktop
    nextcloud-client
    zenBrowser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
