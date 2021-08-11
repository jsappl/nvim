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

---- automatically select first match
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
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- TODO: Fix mappings for pyright.
local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- FIXME: Not working for python/pyright yet (e.g. range function). Works for golang/gopls
    require "lsp_signature".on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "shadow"
        }
    })

    --require("lsp_compl").attach(client, bufnr)

end

-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
-- FIXME: split definitions of keybindings in on_attach function with lua/languageserver.lua file
local servers = { "pyright", "gopls", "julials", "texlab" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end
