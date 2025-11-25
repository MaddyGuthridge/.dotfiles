{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.maddy.shell = pkgs.zsh;
  # The docs warn that failure to add zsh to /etc/shells will make Gnome's login
  # manager refuse to display your account. This didn't appear to be the case in
  # my testing, but it's better safe than sorry.
  environment.shells = with pkgs; [ zsh ];
}
