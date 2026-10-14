{ lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
    # Plasma fights with Gnome's layout too much! Resetting it is too painful.
    # No more Plasma for me :(
    # ./plasma.nix
  ];

  # GDM login screen
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "gnome";

  # Cosmic
  services.desktopManager.cosmic.enable = true;

  # We need to force an SSH program, otherwise Plasma and Gnome fight each other
  programs.ssh.askPassword = lib.mkForce "${pkgs.openssh-askpass.out}/bin/ssh-askpass";
  # Or if we want the KDE one:
  # programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";

  # Keyring -- Gnome Keyring system-wide
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    config.plasma = {
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };
  # GUI secrets manager
  programs.seahorse.enable = true;

  # KDE Connect (open firewall explicitly)
  programs.kdeconnect = {
    enable = true;
  };
}
