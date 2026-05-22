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
vim.keymap.set({ "n", "x" }, "<Leader>cf", vim.lsp.buf.format)

-- picker

vim.keymap.set("n", "<Leader>ff", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<Leader>fg", function() MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<Leader>fb", function() MiniPick.builtin.buffers() end)
vim.keymap.set("n", "<Leader>fh", function() MiniPick.builtin.help() end)

-- ---------------------------------------------------------
-- DIAGNOSTIC
-- ---------------------------------------------------------

vim.diagnostic.config({
  virtual_lines = { current_line = true }
})

-- ---------------------------------------------------------
-- AUTOCOMMANDS
-- ---------------------------------------------------------

-- lazydev

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    require("lazydev").setup({
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    })
  end
})


-- treesitter

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not event.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  },
  callback = function()
    -- highlighting
    vim.treesitter.start()

    -- folds
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end
})

-- ---------------------------------------------------------
-- LSP
-- ---------------------------------------------------------

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")

-- ---------------------------------------------------------
-- PLUGINS
-- ---------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/shatur/neovim-ayu" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

-- colorscheme

require("ayu").setup({ mirage = true })
require("ayu").colorscheme()

-- lualine

require("lualine").setup({ options = { theme = "ayu_mirage" } })

-- mini

require("mini.pick").setup()
require("mini.indentscope").setup({
  symbol = "│",
  options = { try_as_border = true }
})

-- treesitter

require("nvim-treesitter").install({
  "lua",
  "javascript",
  "jsx",
  "typescript",
  "tsx"
})
