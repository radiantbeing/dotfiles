vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.showmatch = true
vim.opt.breakindent = true
vim.opt.colorcolumn = { 100, 120 }
vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }

vim.keymap.set("i", "<c-space>", function()
    vim.lsp.completion.get()
end)

vim.diagnostic.config({
    virtual_lines = { current_line = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
                convert = function(item)
                    return { abbr = item.label:gsub("%b()", "") }
                end,
            })
        end
    end,
})

require("config.lazy")
