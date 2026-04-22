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

