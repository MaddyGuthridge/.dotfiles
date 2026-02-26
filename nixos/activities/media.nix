{ config, pkgs, ... }:
let

  # https://discourse.nixos.org/t/new-to-nixos-and-cant-play-blu-rays/62560/5
  # https://github.com/NixOS/nixpkgs/issues/75646#issuecomment-1832829819
  libbluray = pkgs.libbluray.override {
    withAACS = true;
    withBDplus = true;
    withJava = true;
  };
  vlcBd = pkgs.vlc.override { inherit libbluray; };
  handbrakeBd = pkgs.handbrake.override { inherit libbluray; };
in
{
  boot.kernelModules = [
    # Required for makemkv to work correctly
    # https://discourse.nixos.org/t/makemkv-cant-find-my-usb-blu-ray-drive/23714/4
    "sg"
  ];
  environment.systemPackages = with pkgs; [
    # Currently, MakeMKV servers are down, meaning that rebuilds would fail due
    # to attempting to download the makemkv-bin-1.18.3.tar.gz file, and
    # receiving an incomplete and corrupted copy. As such, I am directly
    # referencing the installed package in order to avoid rebuilding the
    # existing package.
    # makemkv
    (builtins.storePath "/nix/store/7rr30kilhbac4s86zy27s5xc756a5dm9-makemkv-1.18.3/")
    vlcBd
    jellyfin-desktop
    mkvtoolnix
    handbrakeBd
  ];
}
