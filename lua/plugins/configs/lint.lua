local lint = require("lint")

lint.linters_by_ft = {
  lua = { "luacheck" },
  -- sh = { "shellcheck" },  -- many haskell deps
  python = { "flake8", "mypy" },
  tex = { "chktex" },
}

lint.linters.chktex.args = { "-q", "-f%l:%c:%d:%k:%n:%m\n", "-I" }
