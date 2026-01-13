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
    eyedropper
    nasm
  ];

  # Fix uv python ssl.SSLCertVerificationError
  # https://discourse.nixos.org/t/71138
  environment.etc.certfile = {
    source = "/etc/ssl/certs/ca-bundle.crt";
    target = "ssl/cert.pem";
  };
}
