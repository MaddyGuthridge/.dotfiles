# Disable vulnerable modules affected by dirtyfrag.
# https://github.com/V4bel/dirtyfrag
{ ... }:
{
  boot.extraModprobeConfig = ''
    install esp4 /bin/false
    install esp6 /bin/false
    install rxrpc /bin/false
  '';
}
