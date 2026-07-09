" vim: set foldmethod=marker:

" {{{ Options

set colorcolumn=100
set cursorline
set hlsearch
set list
set modelines=5
set mouse=a
set number
set regexpengine=0
set relativenumber
set termguicolors

" }}}

" {{{ Plugins

if empty(glob('$MYVIMDIR/autoload/plug.vim'))
  const link = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent execute '!curl -fLo $MYVIMDIR/autoload/plug.vim --create-dirs ' .. link
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }
Plug 'tpope/vim-sensible'

call plug#end()

" }}}

" {{{ Plugin Config

colorscheme catppuccin_mocha

" }}}

