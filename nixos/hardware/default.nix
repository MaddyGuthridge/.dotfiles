{ pkgs, ... }:
{
  imports = [
    ./yzma.nix
  ];

  # Solaar -- Logitech mouse adapter
  hardware.logitech.wireless.enable = true;
  environment.systemPackages = with pkgs; [
    solaar
    # Tools for debugging docking issues
    tbtools
    pciutils
  ];

  # The system is currently Yzma.
  maddy.system.yzma = true;
}
