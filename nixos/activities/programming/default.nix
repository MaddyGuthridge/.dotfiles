{ config, pkgs, ... }:
{
  imports = [
    ./c.nix
    ./docker.nix
    ./java.nix
    ./js.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./zsh.nix
  ];
  environment.systemPackages = with pkgs; [
    ghostty
    unstable.vscode
    unstable.zed-editor
    unstable.nushell
    insomnia
    unstable.typst
    android-tools
    unstable.mise
  ];
}
