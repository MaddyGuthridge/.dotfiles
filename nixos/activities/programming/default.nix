{ config, pkgs, ... }:
{
  imports = [
    ./c.nix
    ./containers.nix
    ./nix.nix
    ./zsh.nix
  ];
  environment.systemPackages = with pkgs; [
    # Software management
    unstable.mise
    # Terminal emulators
    ghostty
    # Text editors
    unstable.vscode
    unstable.zed-editor
    # zed is zeditor
    (pkgs.writeShellScriptBin "zed" "exec -a $0 ${unstable.zed-editor}/bin/zeditor $@")
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
    ladybird
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
