"     ____  ___    ____  _______    _   ________       _
"    / __ \/   |  / __ \/  _/   |  / | / /_  __/_   __(_)___ ___
"   / /_/ / /| | / / / // // /| | /  |/ / / /  | | / / / __ `__ \
"  / _, _/ ___ |/ /_/ // // ___ |/ /|  / / /  _| |/ / / / / / / /
" /_/ |_/_/  |_/_____/___/_/  |_/_/ |_/ /_/  (_)___/_/_/ /_/ /_/

vim9script

# ==========================================================
# 일반
# ==========================================================

set number
set relativenumber
set cursorline
set signcolumn=yes
set scrolloff=10
set breakindent
set list
set showmatch
set colorcolumn=100,120

set hlsearch
set ignorecase
set smartcase

set mouse=a
set undofile
set regexpengine=0
set exrc
set secure
set termguicolors

colorscheme catppuccin

# ==========================================================
# 키 바인딩
# ==========================================================

g:mapleader = ' '
g:maplocalleader = ' '

# ==========================================================
# 플러그인
# ==========================================================

# `vim-plug`가 설치되어 있지 않으면 자동으로 설치한다.
if empty(glob('~/.vim/autoload/plug.vim'))
    const repo_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    system($'curl -fLo ~/.vim/autoload/plug.vim --create-dirs {repo_url}')
    autocmd VimEnter * {
      PlugInstall --sync
      source $MYVIMRC
    }
endif

# 나열된 플러그인을 설치한다.
plug#begin()

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'

plug#end()

