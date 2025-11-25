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
    unstable.makemkv
    vlcBd
    jellyfin-media-player
    mkvtoolnix
    handbrakeBd
  ];
}
