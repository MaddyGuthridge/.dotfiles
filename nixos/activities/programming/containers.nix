{ ... }:
{
  virtualisation.docker = {
    enable = true;
    # TODO: Is this broken? Docker seems to auto-start?
    enableOnBoot = false;
  };
  # Part of the docker group. Since docker is not on by default, it'll still
  # require root to start the service. After that I can run docker commands
  # rootless.
  users.users.maddy.extraGroups = [ "docker" ];
}
