# Setup things

## Ghostty may not have a terminfo definition

Copy it across over SSH using:

```sh
infocmp -x xterm-ghostty | ssh YOUR-SERVER -- tic -x -
```

<https://ghostty.org/docs/help/terminfo#copy-ghostty's-terminfo-to-a-remote-machine>

## Linux and Windows store time differently

Change Windows settings.

<https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/#make-windows-use-utc-time-by-editing-the-registry>

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
