{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # DAW
    reaper
    # MIDI synth
    fluidsynth
    # Virtual Piano MIDI Keyboard
    vmpk
    # Synth
    vital
  ];
}
