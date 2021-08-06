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

-- complete open completion list, close closes it
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, expr = true, silent = true})
-- buggy (check issues GH)
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({'delta': 4})", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({'delta': -4})", {noremap = true, expr = true, silent = true})


--- Need documentation
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t "<S-Tab>"
    end
end
--- END

vim.api.nvim_set_keymap("i", "<Tab>", 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", 'v:lua.s_tab_complete()', { expr = true })
