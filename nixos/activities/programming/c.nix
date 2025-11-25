{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    clang
    clang-tools
    libxcrypt
    gnumake
    (builtins.getFlake "github:MaddyGuthridge/dcc?ref=master").packages.x86_64-linux.default
  ];
}
