-- Mappings for the plugins

vim.g.mapleader = " "

-- TODO: Move to separate utils.lua file. Circle dependencies?
local key_mapper = function(mode, key, result, noremap)
  noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, result, { noremap = noremap, silent = true })
end

-- Trouble bindings
-- TODO optimize behavior to own style
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>xw",
  "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>xd",
  "<cmd>Trouble lsp_document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>xl",
  "<cmd>Trouble loclist<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>xq",
  "<cmd>Trouble quickfix<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gR",
  "<cmd>Trouble lsp_references<cr>",
  { silent = true, noremap = true }
)

-- Tree bindings
key_mapper("n", "<leader>n", "<cmd>NvimTreeToggle<cr>")
key_mapper("n", "<leader>m", "<cmd>NvimTreeFindFile<cr>")

-- fzy bindings
--TODO move result arguments to plugins.fzy and provide as module. e.g. fzy.find_file, fzy.find_buffer, ...
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('fd', fzy.sinks.edit_file)<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>lua require('plugins.fzy').actions.buffers()<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ft",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.try(fzy.actions.lsp_tags, fzy.actions.buf_tags)<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('git ls-files', fzy.sinks.edit_file)<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fl",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('ag --nobreak --noheading .', require('utils').fzy_edit_ag_selection)<cr>",
  { silent = true, noremap = true }
)

-- TexLab bindings
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>TexlabBuild<cr>", {
  silent = true,
  noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>TexlabForward<cr>", {
  silent = true,
  noremap = true,
})
