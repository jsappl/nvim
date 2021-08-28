-- Mappings for the plugins

vim.g.mapleader = " "

-- TODO: Move to separate utils.lua file. Circle dependencies?
local key_mapper = function(mode, key, result, noremap)
  noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, result, { noremap = noremap, silent = true })
end
