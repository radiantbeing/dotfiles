" vim runtime configuration file

set number relativenumber
set autoindent smartindent
set tabstop=4 shiftwidth=4
set hlsearch
set colorcolumn=100,120

let mapleader = " "
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

call plug#begin()

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

call plug#end()

