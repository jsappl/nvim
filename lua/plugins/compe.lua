vim.o.completeopt = "menuone,noselect"

require("compe").setup{
    enabled = true;
    preselect = "disable";
    source = {
        path = true;
        buffer = true;
        calc = false;
        nvim_lsp = true;
        nvim_lua = true;
    };
}
