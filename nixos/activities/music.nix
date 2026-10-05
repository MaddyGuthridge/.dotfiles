{ config, pkgs, ... }:
let 
  septabee = builtins.getFlake "github:Ap6661/septabee-flake";
in
{
  imports = [
    septabee.nixosModules.default
  ];

  # Septabee DAW
  programs.septabee = {
      enable = true; 
      wayland-deps = true; # Install wayland only dependencies 
      version = "latest"; # like [ "latest" "B_T1" "B_T2" ... ]
      offline = true; # Doesn't require downloading LLVM stuff
      # package = pkgs.septabee; # Septabee of version + wayland-deps
  };
  
  environment.systemPackages = with pkgs; [
    # DAW
    reaper
    audacity
    # MIDI synth
    fluidsynth
    # Virtual Piano MIDI Keyboard
    vmpk
    # Synth
    vital
  ];
}
