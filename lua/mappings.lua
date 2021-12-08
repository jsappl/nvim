local utils = require("utils")

-- map leader
vim.g.mapleader = " "

-- general mappings

-- plugin mappings

-- trouble
-- TODO this are example mappings from docs, optimize behavior to own style
utils.nnoremap("<leader>xx", "<cmd>Trouble<cr>")
utils.nnoremap("<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
utils.nnoremap("<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
utils.nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
utils.nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
utils.nnoremap("gR", "<cmd>Trouble lsp_references<cr>")

-- tree explorer
utils.nnoremap("<leader>n", "<cmd>NvimTreeToggle<cr>")
utils.nnoremap("<leader>m", "<cmd>NvimTreeFindFile<cr>")

-- fzy
--TODO move result arguments to plugins.fzy and provide as module. e.g. fzy.find_file, fzy.find_buffer, ...
utils.nnoremap(
  "<leader>ff",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('fd', fzy.sinks.edit_file)<cr>"
)
utils.nnoremap("<leader>fb", "<cmd>lua require('plugins.fzy').actions.buffers()<cr>")
utils.nnoremap(
  "<leader>ft",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.try(fzy.actions.lsp_tags, fzy.actions.buf_tags)<cr>"
)
utils.nnoremap(
  "<leader>fg",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('git ls-files', fzy.sinks.edit_file)<cr>"
)
utils.nnoremap(
  "<leader>fl",
  "<cmd>lua local fzy = require('plugins.fzy'); fzy.execute('ag --nobreak --noheading .',"
    .. "require('utils').fzy_edit_ag_selection)<cr>"
)

-- texlab
utils.nnoremap("<leader>l", "<cmd>TexlabBuild<cr>")
utils.nnoremap("<leader>v", "<cmd>TexlabForward<cr>")

-- Formatting
-- TODO add range formatting
utils.nnoremap("<leader>tf", "<cmd>lua require('lsp.formatting').toggle()<CR>")
utils.nnoremap("<leader>b", "<cmd>lua vim.lsp.buf.formatting()<CR>")
