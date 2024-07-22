# Setup things

## Linux and Windows store time differently

On Linux, run:

```sh
timedatectl set-local-rtc 1 --adjust-system-clock
```

## Solaar config

```sh
mkdir -p ~/.config
rm -rf ~/.config/solaar
ln -sfd ~/.dotfiles/solaar ~/.config/solaar
```
