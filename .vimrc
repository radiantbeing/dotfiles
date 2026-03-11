" ----------------------------------------
" 색상
" ----------------------------------------

colorscheme catppuccin_mocha " 어두운 보라색의 색 구성표
set termguicolors " 24-bit 색상 사용

" ----------------------------------------
" 탭과 공백
" ----------------------------------------

set tabstop=4 " 탭 문자가 화면에서 차지하는 칸의 개수
set softtabstop=4 " 끼워넣기 모드에서 탭이 이동하는 크기
set shiftwidth=4 " 들여쓰기 연산의 크기
set expandtab " 탭 대신 공백으로 들여쓰기

" ----------------------------------------
" UI
" ----------------------------------------

set number " 줄 번호 표시
set relativenumber " 상대 줄 번호 표
set cursorline " 현재 위치한 줄 강조 표시
set lazyredraw " 필요한 경우에만 화면 갱신
set showmatch " 대응하는 괄호 쌍 강조
set colorcolumn=100,120 " 텍스트 정렬을 위한 강조선

" ----------------------------------------
" 검색
" ----------------------------------------

set incsearch " 문자 입력에 따른 즉각적 검색
set hlsearch " 검색 결과 강조

" ----------------------------------------
" 구문 강조
" ----------------------------------------

set regexpengine=0 " 정규 표현식 엔진 자동 선택

" ----------------------------------------
" 키 바인딩
" ----------------------------------------

let mapleader = " " " Leader 키를 스페이스 바로 변경

" 검색 결과 강조 삭제
nnoremap <Esc> <Cmd>nohlsearch<CR>

" ----------------------------------------
" LSP
" ----------------------------------------

if !has('ide') " Vim 또는 Neovim을 확인
    packadd lsp " yegappan/lsp 플러그인 활성화

    " Vim Scripts 언어 서버 구성
    call LspAddServer([#{
        \   name: 'vimls',
        \   filetype: 'vim',
        \   path: 'vim-language-server',
        \   args: ['--stdio']
        \   }])

    " TypeScript·JavaScript 언어 서버 구성
    call LspAddServer([#{
        \   name: 'typescriptlang',
        \   filetype: ['javascript', 'typescript'],
        \   path: 'typescript-language-server',
        \   args: ['--stdio']
        \   }])

    " Open diagnostic [Q]uickfix list
    nnoremap <Leader>q <Cmd>LspDiag show<CR>

    " [G]oto [R]eferences
    nnoremap grr <Cmd>LspShowReferences<CR>

    " [G]oto [I]mplementation
    nnoremap gri <Cmd>LspGotoImpl<CR>

    " [G]oto [D]efinition
    nnoremap grd <Cmd>LspGotoDefinition<CR>

    " Open Document Symbols
    nnoremap gO <Cmd>LspDocumentSymbol<CR>

    " Search for Workspace Symbols
    nnoremap gW <Cmd>LspSymbolSearch<CR>

    " [G]oto [T]ype Definition
    nnoremap grt <Cmd>LspGotoTypeDef<CR>

    " [R]e[n]ame
    nnoremap grn <Cmd>LspRename<CR>

    " [G]oto Code [A]ction
    nnoremap gra <Cmd>LspCodeAction<CR>
    xnoremap gra <Cmd>LspCodeAction<CR>

    " [G]oto [D]eclaration
    nnoremap grD <Cmd>LspGotoDeclaration<CR>

    " 커서 이동 시 현재 줄의 진단 메시지 출력
    augroup LspCustom
        autocmd!
        autocmd CursorMoved * silent! LspDiag! current
    augroup END
endif

