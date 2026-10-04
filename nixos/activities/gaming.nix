{ config, pkgs, ... }:
{
  # Steam
  programs.steam = {
    enable = true;
    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true;
    # Open ports in the firewall for Source Dedicated Server
    dedicatedServer.openFirewall = true;
    # Open ports in the firewall for Steam Local Network Game Transfers
    localNetworkGameTransfers.openFirewall = true;
  };
  # Enable gamescope session as alternate login
  programs.steam.gamescopeSession.enable = true;
  programs.gamescope.enable = true;
  environment.systemPackages = with pkgs; [
    # Mangohud shows FPS
    mangohud
    # Puzzles
    sgt-puzzles
  ];
}
