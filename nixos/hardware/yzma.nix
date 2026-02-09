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
  };
}
