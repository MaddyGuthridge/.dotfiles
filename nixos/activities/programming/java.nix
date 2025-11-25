{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk17
    jdt-language-server
    # It is literally impossible to access a flake within the same repo with a
    # relative path, even though accessing a flake in the same repo is still
    # pure: https://github.com/NixOS/nix/issues/6353
    # This is INSANITY!
    (builtins.getFlake "path:///home/maddy/Source/nix-experiment/config/activities/programming/gradle")
    .packages.x86_64-linux.default
  ];
}
