vim.g.mapleader = ' '

-- OPTIONS

vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true
vim.o.confirm = true
vim.opt.colorcolumn = { 100 }

-- KEYMAPS

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- AUTOCOMMANDS

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS

vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.')
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- PLUGINS

vim.cmd('packadd! nohlsearch')

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/nvim-mini/mini.completion',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-tree/nvim-web-devicons',
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope 파일 찾기' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope 실시간 텍스트 검색' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope 버퍼 목록' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope 도움말 검색' })

-- which key
vim.keymap.set('n', '<leader>?', function()
  require('which-key').show({ global = false })
end, { desc = '버퍼 단축키 보기' })

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({})

-- mini
require('mini.completion').setup({})

-- catppuccin
vim.cmd.colorscheme('catppuccin-nvim')

