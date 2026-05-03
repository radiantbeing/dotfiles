-- ---------------------------------------------------------
-- OPTIONS
-- ---------------------------------------------------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 10
vim.o.breakindent = true
vim.o.list = true
vim.o.showmatch = true
vim.opt.colorcolumn = { 100 }

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.confirm = true

-- ---------------------------------------------------------
-- KEYMAPS
-- ---------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "v" }, "<Leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<Leader>Y", "\"+Y")
vim.keymap.set({ "n", "v" }, "<Leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<Leader>P", "\"+P")

-- ---------------------------------------------------------
-- PLUGINS
-- ---------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

vim.cmd.colorscheme("catppuccin-frappe")

