# LSP Configuration

## TODO

https://wiki.archlinux.org/title/Language_Server_Protocol

We prefer system-wide LSP installs over `mason.nvim`.

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

```shell
pacman -S ruff flake8 mypy
```

## Lua

We use `luacheck` and `stylua`.

```shell
pacman -S luacheck stylua
```

## Markdown, HTML, CSS, JSON and YAML

We use `prettier` to obtain an out-of-the-box experience for some common web development languages.

```shell
pacman -S prettier
```

```shell
pacman -S marksman
```

## Chktex

Chktex is already part of TeXLive.

## Bash

We don't install `shellcheck`, because it is programmed in Haskell and comes with a lot of dependencies. We only use
`shfmt`.

```shell
pacman -S shfmt
```

## Debuggers

# Python

We use `debugpy`.

```shell
pacman -S python debugpy
```

# Other tools

## Deno

We install `deno` as a requirement for `peek.nvim`.

```shell
pacman -S deno webkit2gtk
```

Also, add `no_focus [title="^Peek preview$"]` to the `sway` config.
