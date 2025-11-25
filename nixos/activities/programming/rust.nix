{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustup
    bacon
  ];
}
