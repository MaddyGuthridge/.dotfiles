{ config, pkgs, ... }:
{
  imports = [
    ./programming
    ./teaching
    ./communication.nix
    ./documents.nix
    ./gaming.nix
    ./media.nix
    ./music.nix
    ./streaming.nix
  ];
}
