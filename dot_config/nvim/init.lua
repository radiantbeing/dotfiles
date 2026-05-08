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
  { src = "https://github.com/folke/lazydev.nvim" }
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
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    })
  end
})

