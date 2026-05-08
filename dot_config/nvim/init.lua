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
vim.o.confirm = true

-- search

vim.o.ignorecase = true
vim.o.smartcase = true

-- tab

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- ---------------------------------------------------------
-- KEYMAPS
-- ---------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- lsp

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
vim.keymap.set("n", "cd", vim.lsp.buf.rename)
vim.keymap.set("n", "gA", vim.lsp.buf.references)
vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "g.", vim.lsp.buf.code_action)

-- picker

vim.keymap.set("n", "<Leader>ff", function () MiniPick.builtin.files() end)
vim.keymap.set("n", "<Leader>fg", function () MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<Leader>fb", function () MiniPick.builtin.buffers() end)
vim.keymap.set("n", "<Leader>fh", function () MiniPick.builtin.help() end)

-- ---------------------------------------------------------
-- LSP
-- ---------------------------------------------------------

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")

-- ---------------------------------------------------------
-- PLUGINS
-- ---------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/shatur/neovim-ayu" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" }
})

-- colorscheme

require("ayu").setup({ mirage = true })
require("ayu").colorscheme()

-- lualine

require("lualine").setup({ options = { theme = "ayu_mirage" } })

-- lazydev

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function ()
    require("lazydev").setup({
      library = { { path = "luvit-meta/library", words = { "vim%.uv" } } }
    })
  end
})

-- Mini

require("mini.pick").setup()

