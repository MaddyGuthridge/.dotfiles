# .dotfiles

My dotfiles to keep basic configuration stuff shared.

## Installation

1. `git clone` the repo to your `/home/` directory
2. Run the install script `./.dotfiles/install.sh`
3. Run any other things you need (eg the `keychron-setup.sh`) script.
4. Restart your terminal.

## What's what

* [`omz/`](./omz): directory containing my [Oh My Zsh](https://ohmyz.sh/) theme

* [`rmview/`](./rmview): directory containing my configuration for `rmview` so
  I can easily screen-share from my ReMarkable tablet to my computer.

* [`backup_ignore.txt`](./backup_ignore.txt): list of folders for KDE's backup
  utility to ignore.

* [`bash_aliases`](./bash_aliases) and [`bashrc`](./bashrc): configuration for
  Bash, not maintained since I don't use it anymore.

* [`inputrc`](./inputrc): configuration for input when using a Bash prompt
  (improves `Ctrl+[Left/Right/Backspace/Delete]` behaviour)

* [`install.sh`](./install.sh): simple install script - creates a bunch of
  symbolic links to the files so that edits can be easily committed and pushed

* [`keychron-setup.sh`](./keychron-setup.sh): script to make function keys of
  Keychron keyboards work correctly.

* [`README.md`](./README.md): this file

* [`solaar`](./solaar/): configuration for my mouse

* [`Utils.md`](./utils.md): a list of programs and utilities I use.

* [`zsh_aliases`](./zsh_aliases) and [`zshrc`](./zshrc): configuration for ZSH,
  including starting up OhMyZsh and stuff. Also contains a ton of useful
  aliases and functions.
