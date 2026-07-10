{ config, pkgs, ... }:
{
  imports = [
    ./c.nix
    ./containers.nix
    ./nix.nix
    ./rpi.nix
    ./zsh.nix
    ./zed.nix
    ./vm.nix
  ];
  environment.systemPackages = with pkgs; [
    # Software management
    unstable.mise
    # Terminal emulators
    ghostty
    unstable.ratty
    # Text editors
    unstable.vscode
    unstable.vscodium
    # API clients
    insomnia
    unstable.bruno
    # Programming languages
    unstable.nushell
    unstable.typst
    nasm
    # Additional tools
    jdt-language-server
    android-tools
    eyedropper
    bat
    gh # GitHub CLI
    # Additional web browsers for testing
    ungoogled-chromium
    # Ladybird currently does not build on 26.05
    # ladybird
    # Webdrivers
    geckodriver
    chromedriver
  ];

  # Fix uv python ssl.SSLCertVerificationError
  # https://discourse.nixos.org/t/71138
  environment.etc.certfile = {
    source = "/etc/ssl/certs/ca-bundle.crt";
    target = "ssl/cert.pem";
  };
}
