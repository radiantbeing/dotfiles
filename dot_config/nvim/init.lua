vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.colorcolumn = { 100 }

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("user-pack-changed", { clear = true }),
	callback = function(event)
		local name, kind = event.data.spec.name, event.data.kind

		-- Treesitter 언어 파서를 최신화한다.
		if name == "nvim-treesitter" and kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})
