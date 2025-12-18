{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # UML and C4 modelling
    unstable.gaphor
    # Remote access to CSE
    tigervnc
    # Presentations
    input-remapper
  ];

  # BRO WHY DOES THIS NOT WORK
  # services.input-remapper.enable = true;
}
