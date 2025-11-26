{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.launch-new-instance
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pip-on-top
    gnomeExtensions.gsconnect
    gnomeExtensions.hide-minimized
    gnomeExtensions.lock-keys
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.panel-workspace-scroll
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.pano
    gnomeExtensions.wintile-windows-10-window-tiling-for-gnome
    wl-clipboard
  ];
}
