-- Mappings for the plugins

vim.g.mapleader = " "

-- TODO: Move to separate utils.lua file. Circle dependencies?
local key_mapper = function(mode, key, result, noremap)
    noremap = noremap or true
    vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = noremap, silent = true}
    )
end

-- reload-hack
vim.api.nvim_set_keymap("n", "<leader>sv", "<cmd>luafile $MYVIMRC<CR>", {noremap = true, silent = true})

-- automatically select first match
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({'keys': '<CR>', 'select': v:true})", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, expr = true, silent = true})

--inoremap <silent><expr> <C-Space> compe#complete()
--inoremap <silent><expr> <CR>      compe#confirm('<CR>')
--inoremap <silent><expr> <C-e>     compe#close('<C-e>')
--inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
--inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
