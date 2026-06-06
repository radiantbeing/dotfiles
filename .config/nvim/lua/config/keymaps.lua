vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
