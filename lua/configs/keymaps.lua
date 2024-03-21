local maphelper = require("utils.mappings")

-- map leader
vim.g.mapleader = " "

-- general mappings

-- switch to previous/next tab
maphelper.nnoremap("<C-n>", ":bnext<cr>")
maphelper.nnoremap("<C-p>", ":bprevious<cr>")

-- disable ex module
maphelper.nnoremap("Q", "<Nop>")

-- clear search highlights
maphelper.nnoremap("<leader>/", ":nohlsearch<cr><C-L>")

-- resize windows
maphelper.nnoremap("<C-Up>", ":resize +3<CR>")
maphelper.nnoremap("<C-Down>", ":resize -3<CR>")
maphelper.nnoremap("<C-Left>", ":vertical resize -6<CR>")
maphelper.nnoremap("<C-Right>", ":vertical resize +6<CR>")

-- improved indenting
maphelper.vnoremap("<", "<gv")
maphelper.vnoremap(">", ">gv")

-- copy & paste
maphelper.nnoremap("<leader>y", '"+y')
maphelper.vnoremap("<leader>y", '"+y')
-- copy text with hard line wraps replaced by soft ones
-- TODO clear search highlights afterwards
-- stylua: ignore
maphelper.xnoremap("<leader>yt", [[:s/\([^\\_^]\)\n\([^\n]\)/\1 \2/<cr>gv"+yu]])

-- formatting
-- TODO add range formatting
maphelper.nnoremap("<leader>tf", "<cmd>lua require('utils.formatting').toggle()<CR>")
maphelper.nnoremap("<leader>b", "<cmd>lua require('utils.formatting').format_on_key()<CR>")

-- -- plugin mappings
--
-- -- trouble
-- -- TODO this are example mappings from docs, optimize behavior to own style
-- maphelper.nnoremap("<leader>xx", "<cmd>Trouble<cr>")
-- maphelper.nnoremap("<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
-- maphelper.nnoremap("<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
-- maphelper.nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
-- maphelper.nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
-- maphelper.nnoremap("gR", "<cmd>Trouble lsp_references<cr>")

-- tree explorer
maphelper.nnoremap("<leader>n", "<cmd>Neotree toggle<cr>")
maphelper.nnoremap("<leader>m", "<cmd>Neotree reveal<cr>")

-- -- fzy
-- --TODO move result arguments to plugins.fzy and provide as module. e.g. fzy.find_file, fzy.find_buffer, ...
-- utils.nnoremap("<leader>ff", "<cmd>lua require('plugins.fzy').find_file()<cr>")
-- utils.nnoremap("<leader>fg", "<cmd>lua require('plugins.fzy').find_git_file()<cr>")
-- utils.nnoremap("<leader>fl", "<cmd>lua require('plugins.fzy').live_grep()<cr>")
--
-- -- texlab
-- utils.nnoremap("<leader>l", "<cmd>TexlabBuild<cr>")
-- utils.nnoremap("<leader>v", "<cmd>TexlabForward<cr>")
--
-- -- symbols
-- utils.nnoremap("<leader>so", "<cmd>SymbolsOutline<cr>")
--
-- -- peek markdown preview
-- utils.nnoremap("<leader>tp", "<cmd>lua require('plugins.peek').toggle()<CR>")
--
-- nvim-dap

maphelper.nnoremap("<F5>", "<cmd>lua require('dap').continue()<cr>")
maphelper.nnoremap("<F10>", "<cmd>lua require('dap').step_over()<cr>")
maphelper.nnoremap("<F11>", "<cmd>lua require('dap').step_into()<cr>")
maphelper.nnoremap("<F12>", "<cmd>lua require('dap').step_out()<cr>")
maphelper.nnoremap("<Leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
-- TODO start with a few functional key mappings and in README describe all key mappings including example
--maphelper.nnoremap("<Leader>B", "<cmd>lua require('dap').set_breakpoint()<cr>")
--maphelper.nnoremap(
--  "<Leader>lp",
--  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
--)
--maphelper.nnoremap("<Leader>dr", "<cmd>lua require('dap').repl.open()<cr>")
--maphelper.nnoremap("<Leader>dl", "<cmd>lua require('dap').run_last()<cr>")
--
--maphelper.nnoremap("<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>")
--maphelper.vnoremap("<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>")
--
--maphelper.nnoremap("<Leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>")
--maphelper.vnoremap("<Leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>")

--TODO move funciton to plugin and provide as module method
--maphelper.nnoremap("<Leader>df", function()
--  local widgets = require("dap.ui.widgets")
--  widgets.centered_float(widgets.frames)
--end)
--maphelper.nnoremap("<Leader>ds", function()
--  local widgets = require("dap.ui.widgets")
--  widgets.centered_float(widgets.scopes)
--end)
--
---- nvim-dap-python
--maphelper.nnoremap("<Leader>dn", "<cmd>lua require('dap-python').test_method()<cr>")
--maphelper.nnoremap("<Leader>df", "<cmd>lua require('dap-python').test_class()<cr>")
