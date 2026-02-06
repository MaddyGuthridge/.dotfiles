{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # DSLR as webcam
    gphoto2
    ffmpeg
    v4l-utils
    # Video editing
    kdePackages.kdenlive
    shotcut
    davinci-resolve
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  boot.kernelModules = [
    # Allow creating arbitrary webcams
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
  };
}
