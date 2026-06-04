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
vim.o.foldlevelstart = 99
vim.o.winborder = "single"

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

-- ---------------------------------------------------------
-- DIAGNOSTIC
-- ---------------------------------------------------------

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

-- ---------------------------------------------------------
-- AUTOCOMMANDS
-- ---------------------------------------------------------

-- ---------------------------------------------------------
-- LSP
-- ---------------------------------------------------------

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")

-- ---------------------------------------------------------
-- AUTOCOMMANDS
-- ---------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    require("lazydev").setup({
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = event.data.path }):wait()
    end
  end,
})

-- ---------------------------------------------------------
-- PLUGINS
-- ---------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/arborist-ts/arborist.nvim" },
})

-- colorscheme

require("catppuccin").setup({
  transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-nvim")

-- lualine

require("lualine").setup({})

-- telescope

require("telescope").setup({})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- arborist

require("arborist").setup()
