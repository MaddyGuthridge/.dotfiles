{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    input-remapper
    unstable.gaphor
    tigervnc
  ];

  # BRO WHY DOES THIS NOT WORK
  # services.input-remapper.enable = true;
}
