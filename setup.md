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

## Emails

List of emails to set up

* UNSW
* Outlook
    * Miguel
    * HDSQ (.com.au)
* Gmail
    * Miguel
    * Miguel 2
    * Maddy
* Disroot
* MaddyGuthridge.com (zoho)

### Configuration

* [Zoho server settings](https://www.zoho.com/mail/help/imap-access.html)

* [UNSW config](./setup/unsw-email-config.pdf)
