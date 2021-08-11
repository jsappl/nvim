-- Basic settings

local opt = vim.opt

-- minimal working config
opt.relativenumber = true  -- Show relative line numbers
opt.number = true          -- Enable hybrid relative ln
opt.textwidth = 120        -- Line wrap (number of cols)
opt.linebreak = true       -- Break lines at word (requires Wrap lines)
opt.showbreak = "+++"      -- Wrap-broken line prefix

opt.tabstop = 4            -- Ensure files with tabs look the same
opt.shiftwidth = 4         -- Number of auto-indent spaces
opt.expandtab = true       -- Use spaces instead of tabs
opt.softtabstop = -1       -- Number of spaces per <Tab> (use value of sw)
opt.smarttab = true        -- Enable smart-tabs (<Tab> will always use sw)

opt.autoindent = true      -- Auto-indent new lines
opt.smartindent = false    -- Disable smart-indent

opt.hlsearch = true        -- Highlight all search results
opt.ignorecase = true      -- Always case-insensitive
opt.smartcase = true       -- Enable smart-case search (override ic)
opt.incsearch = true       -- Searches for strings incrementally

opt.mouse = "a"            -- Allow to set pointer pos with mouse
opt.backspace = {          -- Backspace behaviour
    "indent",
    "eol",
    "start"
}

opt.showmatch = true       -- Highlight matching brace
opt.visualbell = true      -- Use visual bell (no beeping)
opt.ruler = true           -- Show row and column ruler information
opt.showmode = false       -- Hide insert status
opt.syntax = "on"          -- Enable syntax highlighting

opt.autowriteall = true    -- Save files when opening new files

-- toggle number modes (normal mode = relative, other modes = absolute)
vim.cmd([[
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave  * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
    augroup END
]])

-- various file formats
vim.cmd([[
    autocmd FileType sh setlocal et ts=2 sw=2
    autocmd FileType go setlocal noet ts=4 sw=4
]])

vim.cmd([[let g:python3_host_prog = expand('$HOME/.pyenv/versions/neovim/bin/python')]])

--TODO: filetype plugin indent on  -- Enable filetype detection and load its settings
