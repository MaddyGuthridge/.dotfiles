{ config, pkgs, ... }:
{
  imports = [
    ./c.nix
    ./docker.nix
    ./nix.nix
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
    jdt-language-server
  ];
}
