vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = event.data.path }):wait()
    end
  end,
})

require("telescope").setup({})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
