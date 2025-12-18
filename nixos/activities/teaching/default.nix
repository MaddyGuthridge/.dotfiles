{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # UML and C4 modelling
    unstable.gaphor
    # Remote access to CSE
    tigervnc
    # Presentations
    input-remapper
    # DSLR as webcam
    gphoto2
    ffmpeg
    obs-studio
    v4l-utils
  ];
  
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  boot.kernelModules = [
    # Allow creating arbitrary webcams
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  # BRO WHY DOES THIS NOT WORK
  # services.input-remapper.enable = true;
}
