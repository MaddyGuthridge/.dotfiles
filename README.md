# .dotfiles

Become Maddy by stealing her dotfiles.

## Installation

1. `git clone` the repo to your `$HOME` directory
2. Install [`mise`](https://mise.jdx.dev/), which will allow you to install all
   other required tools.
3. `mise x cargo:tuckr -- tuckr set --only-files global $(hostname)` 
   to set up all dotfiles.

Once this is done, you can use `tuckr add global $(hostname)` to update dotfiles. (actually don't do this Tuckr is broken currently).

| Target   | Purpose         |
| -------- | --------------- |
| `global` | Global settings |
| `yzma`   | Laptop          |
| `ursula` | Server          |
| `cse`    | CSE servers     |

## Development setup

I manage most tooling using [`mise`](https://mise.jdx.dev/). After setting up
configurations, it should be trivial to install Mise and run `mise install` to download and install all the tools I use.

## Dotfile management

I manage my dotfiles using [`tuckr`](https://github.com/RaphGL/Tuckr). After
the bootstrapping process (which uses `mise` to execute `tuckr` without
installing it), `tuckr` should be added just by running `mise install`. From
there, you can refer to its documentation to make any changes you desire.

## What's what

* [`Sources`](./Sources): Sourced files for Bash and ZSH

* [`Docs`](./Docs): Documentation and setup instructions for various things.

* [`Configs`](./Configs): Configuration files, organised by install target.

* [`Hooks`](./Hooks): Setup hooks.

* [`Other`](./Other): Other stuff, mostly old configs which I don't use
  currently.

* [`README.md`](./README.md): this file.
