{ config, pkgs, ... }:
let

  # # https://discourse.nixos.org/t/new-to-nixos-and-cant-play-blu-rays/62560/5
  # # https://github.com/NixOS/nixpkgs/issues/75646#issuecomment-1832829819
  # libbluray = pkgs.libbluray.override {
  #   withAACS = true;
  #   withBDplus = true;
  #   withJava = true;
  # };
  # vlcBd = pkgs.vlc.override { inherit libbluray; };
  # handbrakeBd = pkgs.handbrake.override { inherit libbluray; };
in
{
  boot.kernelModules = [
    # Required for makemkv to work correctly
    # https://discourse.nixos.org/t/makemkv-cant-find-my-usb-blu-ray-drive/23714/4
    "sg"
  ];
  environment.systemPackages = with pkgs; [
    vlc
    # vlcBd

    handbrake
    # handbrakeBd
    # Keep above non-overridden until I fix build issues.

    # MakeMKV's servers are once again acting up, so I need to pin it to an old
    # version yet again.
    # makemkv
    (builtins.storePath "/nix/store/lpnqkxb9hmxiq1hlnn6d8q14ql8wfdmw-makemkv-1.18.3/")

    # Pinning to 25.11 due to visual glitches in 25.06
    # https://github.com/NixOS/nixpkgs/issues/519073
    nixos2511.jellyfin-desktop

    mkvtoolnix
    yt-dlp
    imagemagick
  ];
}
