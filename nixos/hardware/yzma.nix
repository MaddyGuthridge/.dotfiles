{
  config,
  lib,
  pkgs,
  ...
}:
let
  nixos-hardware = builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; };
in
{
  # Annoyingly, this import is always evaluated. There doesn't seem to be a good
  # way to conditionally enable hardware configs from the nixos-hardware repo.
  # https://github.com/NixOS/nixos-hardware/issues/885
  imports = [
    "${nixos-hardware}/dell/xps/15-9500/nvidia"
  ];

  options = {
    maddy.system.yzma = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Yzma laptop config";
    };
  };

  config = lib.mkIf config.maddy.system.yzma {
    networking.hostName = "yzma"; # Define your hostname.

    # Windows 11 mount
    fileSystems."/media/kronk" = {
      device = "/dev/disk/by-uuid/3204BB1604BADC53";
      fsType = "ntfs3";
    };

    # Fingerprint sensor
    # While I wait for https://github.com/NixOS/nixos-hardware/pull/1761
    services.fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };

    # Disable fingerprint for sudo and Gnome Polkit, as they mean I cannot enter a
    # password unless I first fail the fingerprint scan 3 times. Very annoying.
    # https://github.com/NixOS/nixpkgs/issues/171136
    # https://discussion.fedoraproject.org/t/authenticate-with-password-in-authentication-required-prompt/86932
    # https://gitlab.freedesktop.org/libfprint/libfprint/-/issues/403
    # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/5445
    #
    # Supposedly, sudo (using fprintd) should fall back to password on SIGINT:
    # https://gitlab.freedesktop.org/libfprint/fprintd/-/commit/657f58fd648e35417ce7266b9c1558ce497dc179
    # But this did not work for me.
    #
    # This could hypothetically be fixed using this patch, but I am not brave
    # enough to run something called "gross hack" when it comes to auth:
    # https://gitlab.com/mishakmak/pam-fprint-grosshack
    security.pam.services.sudo.fprintAuth = false;
    security.pam.services.polkit-1.fprintAuth = false;
  };
}
