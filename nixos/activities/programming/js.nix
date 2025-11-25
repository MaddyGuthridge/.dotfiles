{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodejs_20
    unstable.bun
  ];
}
