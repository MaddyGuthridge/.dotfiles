{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (builtins.getFlake "path:///home/maddy/.dotfiles/nixos/activities/teaching/slides-xp")
    .packages.x86_64-linux.default

    input-remapper
    unstable.gaphor
  ];

  # BRO WHY DOES THIS NOT WORK
  # services.input-remapper.enable = true;
}
