vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.colorcolumn = { 100 }
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect", "popup" }

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

vim.keymap.set("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		end
	end,
})
