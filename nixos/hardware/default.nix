{ config, pkgs, ... }:
{
  imports = [
    # Wait there is a pre-made hardware configuration specifically for my system
    # which will automatically set up my GPU and a bunch of other things?!
    "${
      builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
    }/dell/xps/15-9500/nvidia"
  ];
}
