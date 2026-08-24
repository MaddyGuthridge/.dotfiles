{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkg-config # Allow programs to detect configuration of other programs
  ];

  # Make openssl discoverable for rust compilation
  # https://github.com/rust-openssl/rust-openssl/issues/1663#issuecomment-1603606249
  programs.nix-ld.libraries = [ pkgs.openssl ];
  environment.variables = {
    PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
