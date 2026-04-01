vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local ts_langs = {
	"jsx",
	"javascript",
	"lua",
	"tsx",
	"typescript",
}

require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
require("nvim-treesitter").install(ts_langs)

-- Treesitter 문법 강조를 활성화한다.
vim.api.nvim_create_autocmd("FileType", {
	pattern = ts_langs,
	callback = function()
		vim.treesitter.start()
	end,
})
