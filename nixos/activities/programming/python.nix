{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.uv
    poetry
  ];
}
