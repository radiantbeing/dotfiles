-- 일반
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- 들여쓰기
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- 시각적 정보
vim.opt.list = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.colorcolumn = { 100 }

-- 키 맵
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 진단 메시지 표시
vim.diagnostic.config({
    virtual_lines = { current_line = true },
})

require("config.lazy")
