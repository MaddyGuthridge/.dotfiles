{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunderbird-esr
    unstable.teams-for-linux
    unstable.discord
    slack
    zoom-us
    signal-desktop
    nextcloud-client
  ];
}
