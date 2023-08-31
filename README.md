# .dotfiles

My dotfiles to keep basic configuration stuff shared.

## Installation

1. `git clone` the repo to your `$HOME` directory
2. Run the install script `./.dotfiles/install.sh`
3. Run any other things you need (eg the `keychron-setup.sh`) script.
4. Restart your terminal.

## What's what

* [`aliases`](./aliases): aliases shared between Bash and Zsh

* [`autostart.md`](./autostart.md): instructions to make programs run
  minimised.

* [`backup_ignore.txt`](./backup_ignore.txt): list of folders for KDE's backup
  utility to ignore.

* [`bashrc`](./bashrc): configuration for Bash, not maintained since I don't
  use it much anymore.

* [`gnome.md`](./gnome.md): documentation on tweaks I make to Gnome

* [`inputrc`](./inputrc): configuration for input when using a Bash prompt
  (improves `Ctrl+[Left/Right/Backspace/Delete]` behaviour)

* [`install.sh`](./install.sh): simple install script - creates a bunch of
  symbolic links to the files so that edits can be easily committed and pushed

* [`keychron-setup.sh`](./keychron-setup.sh): script to make function keys of
  Keychron keyboards work correctly.

* [`obsidian`](./obsidian): script to start Obsidian in its vault picker,
  rather than opening the most recent vault.

* [`omz/`](./omz): directory containing my [Oh My Zsh](https://ohmyz.sh/) theme

* [`README.md`](./README.md): this file

* [`rmview/`](./rmview): directory containing my configuration for `rmview` so
  I can easily screen-share from my ReMarkable tablet to my computer.

* [`solaar`](./solaar/): configuration for my mouse

* [`utils.md`](./utils.md): a list of programs and utilities I use.

* [`zshrc`](./zshrc): configuration for ZSH, including starting up OhMyZsh and
  stuff.
