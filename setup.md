# Setup things

## Linux and Windows store time differently

On Linux, run:

```sh
timedatectl set-local-rtc 1 --adjust-system-clock
```

Apparently this isn't ideal (TODO: was it better on Windows, if so how to set it up?)

## Solaar config

```sh
mkdir -p ~/.config
rm -rf ~/.config/solaar
ln -sfd ~/.dotfiles/solaar ~/.config/solaar
```

## Email configuration

* [Zoho server settings](https://www.zoho.com/mail/help/imap-access.html)

* [UNSW config](./setup/unsw-email-config.pdf)
