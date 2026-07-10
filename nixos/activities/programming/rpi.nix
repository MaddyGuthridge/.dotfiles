# Raspberry pi tools
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rpi-imager
  ];
}
