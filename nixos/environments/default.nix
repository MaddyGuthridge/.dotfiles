{ lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./plasma.nix
  ];

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
}
