# .dotfiles

Become Maddy by stealing her dotfiles.

## Installation

1. `git clone` the repo to your `$HOME` directory
2. Install [`mise`](https://mise.jdx.dev/), which will allow you to install all
   other required tools.
3. `mise use cargo:tuckr` to install `tuckr`
4. `tuckr set global $(hostname)`

For example, to set up `yzma`, you can run `tuckr set global yzma`.

| Target   | Purpose         |
| -------- | --------------- |
| `global` | Global settings |
| `yzma`   | Laptop          |
| `ursula` | Server          |
| `cse`    | CSE servers     |

## Development setup

I manage most tooling using [`mise`](https://mise.jdx.dev/). After setting up
configurations, it should be trivial to install Mise and run `mise install` to download and install all the tools I use.

## What's what

* [`Sources`](./Sources): Sourced files for Bash and ZSH

* [`Docs`](./Docs): Documentation and setup instructions for various things.

* [`Configs`](./Configs): Configuration files, organised by install target.

* [`Hooks`](./Hooks): Setup hooks.

* [`Other`](./Other): Other stuff, mostly old configs which I don't use
  currently.

* [`README.md`](./README.md): this file.
