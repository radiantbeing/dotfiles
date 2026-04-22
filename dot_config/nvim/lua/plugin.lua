-- colorscheme
vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
vim.cmd.colorscheme("catppuccin-nvim")

-- status line
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim"
})
require("lualine").setup({})

-- treesitter
vim.api.nvim_create_autocmd("PackChanged", { callback = function (event)
  local name = event.data.spec.name
  local kind = event.data.kind
  if name == "nvim-treesitter" and kind == "update" then
    if not event.data.active then
      vim.cmd.packadd("nvim-treesitter")
    end
    vim.cmd("TSUpdate")
  end
end })
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "typescript",
    "javascript",
    "python"
  },
  callback = function()
    vim.treesitter.start()
  end
})
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
require("nvim-treesitter").install({
  "typescript",
  "javascript",
  "python"
})

-- lsp
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim"
})
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls" }
})

