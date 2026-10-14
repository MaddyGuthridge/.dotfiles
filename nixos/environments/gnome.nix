{ config, pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    # Ensure Adwaita icons are always present
    adwaita-icon-theme
    gnome-tweaks
    # Extensions
    gnomeExtensions.launch-new-instance
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pip-on-top
    gnomeExtensions.hide-minimized
    gnomeExtensions.lock-keys
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.panel-workspace-scroll
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.pano
    gnomeExtensions.wintile-windows-10-window-tiling-for-gnome
    gnomeExtensions.astra-monitor
    wl-clipboard
    # Explicit gsconnect (avoid conflict with KDE)
    gnomeExtensions.gsconnect
  ];

  # Force Gnome default icon and cursor settings
  # Note: this doesn't work as KDE sets these values imperatively per-user.
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        # Default icon and cursor theme
        "org/gnome/desktop/interface" = {
          icon-theme = "Adwaita";
          cursor-theme = "Adwaita";
          font-name = "Adwaita Sans 11";
          document-font-name = "Liberation Serif 11";
          monospace-font-name = "Hack 11";
        };
        # No maximise and minimise buttons
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:close";
        };
      };
    }
  ];
}
