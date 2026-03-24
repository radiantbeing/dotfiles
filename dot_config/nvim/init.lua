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

vim.diagnostic.config({
    virtual_lines = { current_line = true },
})

require("config.lazy")
