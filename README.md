# LSP Configuration

Add language server to config with `lspconfig` if not otherwise mentioned.

## Python

```{shell}
pacman -S pyright
```

## Latex: TexLab and LTeX

```shell
pacman -S texlab
```

LTeX binaries are installed using `Mason`. However, `JAVA_HOME` is required to be defined:

```shell
pacman -S jre-openjdk-headless
```

## Bash

```shell
pacman -S bash-language-server
```

## Julia

Read and follow instructions from
[here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#julials).

# Formatters and Linters

## Python

To-Do: packages installed in virtual env and linked into ~/bin? Or install system-wide with pacman?

## Lua

We use `luacheck` and `stylua`.

**Note:** Tried `luaformatter` first, but the out-of-box experience with `stylua` is just much better. But comes of cost
of adding `rust` and using its package manager.

```shell
pacman -S luarocks

luarocks install luacheck
```

```shell
pacman -S rust

cargo install stylua

ln -s ~/.cargo/bin/stylua ~/bin
chmod +x ~/bin/stylua
```

## Markdown, HTML, CSS, JSON and YAML

We use `prettier` to obtain an out-of-the-box experience for some common web development languages.

```shell
pacman -S prettier
```

## Chktex

Chktex is already part of TeXLive.

## Bash

We install `shellcheck`, which is programmed in Haskell and comes with a few dependencies.

```shell
pacman -S shellcheck
```

# Other tools

## Deno

We install `deno` as a requirement for `peek.nvim`.

```shell
pacman -S deno webkit2gtk
```

Also, add `no_focus [title="^Peek preview$"]` to the `sway` config.
