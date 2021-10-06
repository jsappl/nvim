# LSP Configuration

Add language server to config with `lspconfig` if not otherwise mentioned.

## Python

```{shell}
pacman -S pyright
```

## Go

```{shell}
pacman -S gopls
```

A good test resource can be installed via `git clone https://go.googlesource.com/example`.

# Formatters and Linters

## Python

To-Do: packages installed in virtual env and linked into ~/bin? Or install system-wide with pacman?

## Lua

We use `luacheck` and `stylua`.

**Note:** Tried `luaformatter` first, but the out-of-box experience with `stylua` is just much better. But comes of cost
of adding `rust` and using it's package manager.

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

## Texlab and Chktex

We install Texlab with

```shell
pacman -S Texlab
```

Chktex is already part of TeXLive.
