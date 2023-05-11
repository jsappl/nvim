local utils = require("utils")

-- map leader
vim.g.mapleader = " "

-- general mappings

-- switch to previous/next tab
utils.nnoremap("<C-n>", ":bnext<cr>")
utils.nnoremap("<C-p>", ":bprevious<cr>")

-- disable ex module
utils.nnoremap("Q", "<Nop>")

-- clear search highlights
utils.nnoremap("<leader>/", ":nohlsearch<cr><C-L>")

-- resize windows
utils.nnoremap("<C-Up>", ":resize +3<CR>")
utils.nnoremap("<C-Down>", ":resize -3<CR>")
utils.nnoremap("<C-Left>", ":vertical resize -6<CR>")
utils.nnoremap("<C-Right>", ":vertical resize +6<CR>")

-- improved indenting
utils.vnoremap("<", "<gv")
utils.vnoremap(">", ">gv")

-- copy & paste
utils.nnoremap("<leader>y", '"+y')
utils.vnoremap("<leader>y", '"+y')
-- copy text with hard line wraps replaced by soft ones
-- TODO clear search highlights afterwards
-- stylua: ignore
utils.xnoremap("<leader>yt", [[:s/\([^\\_^]\)\n\([^\n]\)/\1 \2/<cr>gv"+yu]])

-- formatting
-- TODO add range formatting
utils.nnoremap("<leader>tf", "<cmd>lua require('lsp.formatting').toggle()<CR>")
utils.nnoremap("<leader>b", "<cmd>lua vim.lsp.buf.format()<CR>")

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
utils.nnoremap("<leader>ff", "<cmd>lua require('plugins.fzy').find_file()<cr>")
utils.nnoremap("<leader>fg", "<cmd>lua require('plugins.fzy').find_git_file()<cr>")
utils.nnoremap("<leader>fl", "<cmd>lua require('plugins.fzy').live_grep()<cr>")

-- texlab
utils.nnoremap("<leader>l", "<cmd>TexlabBuild<cr>")
utils.nnoremap("<leader>v", "<cmd>TexlabForward<cr>")

-- symbols
utils.nnoremap("<leader>so", "<cmd>SymbolsOutline<cr>")

-- peek markdown preview
utils.nnoremap("<leader>tp", "<cmd>lua require('plugins.peek').toggle()<CR>")

-- nvim-dap

utils.nnoremap("<F5>", "<cmd>lua require('dap').continue()<cr>")
utils.nnoremap("<F10>", "<cmd>lua require('dap').step_over()<cr>")
utils.nnoremap("<F11>", "<cmd>lua require('dap').step_into()<cr>")
utils.nnoremap("<F12>", "<cmd>lua require('dap').step_out()<cr>")
utils.nnoremap("<Leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
utils.nnoremap("<Leader>B", "<cmd>lua require('dap').set_breakpoint()<cr>")
utils.nnoremap(
  "<Leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
)
utils.nnoremap("<Leader>dr", "<cmd>lua require('dap').repl.open()<cr>")
utils.nnoremap("<Leader>dl", "<cmd>lua require('dap').run_last()<cr>")

utils.nnoremap("<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>")
utils.vnoremap("<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>")

utils.nnoremap("<Leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>")
utils.vnoremap("<Leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>")

--TODO move funciton to plugin and provide as module method
--utils.nnoremap("<Leader>df", function()
--  local widgets = require("dap.ui.widgets")
--  widgets.centered_float(widgets.frames)
--end)
--utils.nnoremap("<Leader>ds", function()
--  local widgets = require("dap.ui.widgets")
--  widgets.centered_float(widgets.scopes)
--end)

-- nvim-dap-python
utils.nnoremap("<Leader>dn", "<cmd>lua require('dap-python').test_method()<cr>")
utils.nnoremap("<Leader>df", "<cmd>lua require('dap-python').test_class()<cr>")
