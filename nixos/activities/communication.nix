{ config, pkgs, ... }:
let
  zenBrowser = builtins.getFlake "github:youwen5/zen-browser-flake";
in
{
  environment.systemPackages = with pkgs; [
    thunderbird-esr
    unstable.teams-for-linux
    unstable.discord
    slack
    zoom-us
    signal-desktop
    nextcloud-client
    zenBrowser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
  ];
}
