{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # UML and C4 modelling
    gaphor
    # Remote access to CSE
    tigervnc
    # Presentations
    input-remapper
  ];

  services.input-remapper.enable = true;
  services.input-remapper.enableUdevRules = true;
}
