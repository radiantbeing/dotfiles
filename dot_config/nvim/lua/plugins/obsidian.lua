vim.pack.add({
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") }
})

require("obsidian").setup(
  ---@module "obsidian"
  ---@type obsidian.config
  {
    legacy_commands = false,
    workspaces = {
      {
        name = "personalai",
        path = "~/Documents/vaults/personalai"
      }
    }
  }
)
