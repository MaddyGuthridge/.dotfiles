{ config, pkgs, ... }:
{
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
