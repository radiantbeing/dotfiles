" ==========================================================
" 플러그인
" ==========================================================

" vim-plug 자동 설치
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 플러그인 목록
call plug#begin()

Plug 'tpope/vim-sensible' " Vim의 합리적인 기본값
Plug 'sheerun/vim-polyglot' " 향상된 구문 강조·들여쓰기를 위한 언어 팩
Plug 'sainnhe/sonokai' " Monokai Pro 기반의 색상 스키마

call plug#end()

" ==========================================================
" 색상
" ==========================================================

set termguicolors " 24-bit 색상 사용

let g:sonokai_style = 'andromeda' " 색상 스키마의 스타일
let g:sonokai_better_performance = 1 " 색상 스키마 로드 시간 감소

colorscheme sonokai " 색상 스키마 지정

" ==========================================================
" 탭과 공백
" ==========================================================

set tabstop=4 " 탭 문자가 화면에서 차지하는 칸의 개수
set softtabstop=4 " 끼워넣기 모드에서 탭이 이동하는 크기
set shiftwidth=4 " 들여쓰기 연산의 크기
set expandtab " 탭 대신 공백으로 들여쓰기

" ==========================================================
" UI
" ==========================================================

set number " 줄 번호 표시
set relativenumber " 상대 줄 번호 표
set cursorline " 현재 위치한 줄 강조 표시
set lazyredraw " 필요한 경우에만 화면 갱신
set showmatch " 대응하는 괄호 쌍 강조
set colorcolumn=100,120 " 텍스트 정렬을 위한 강조선

" ==========================================================
" 검색
" ==========================================================

set incsearch " 문자 입력에 따른 즉각적 검색
set hlsearch " 검색 결과 강조

" ==========================================================
" 구문 강조
" ==========================================================

set regexpengine=0 " 정규 표현식 엔진 자동 선택

" ==========================================================
" 구성 불러오기
" ==========================================================

set exrc " 현재 디렉터리의 .vimrc 불러오기
set secure " 현재 디렉터리에서 불러온 .vimrc의 autocmd, 셸 및 쓰기 명령어 실행 불허

" ==========================================================
" 키 바인딩
" ==========================================================

let mapleader = " " " Leader 키를 스페이스 바로 변경

" 검색 결과 강조 삭제
nnoremap <Esc> <Cmd>nohlsearch<CR><Esc>

" ==========================================================
" LSP
" ==========================================================

if !has('ide') " Vim 또는 Neovim을 확인
    packadd lsp " yegappan/lsp 플러그인 활성화

    " 언어 서버 추가
    call LspAddServer([
      \ #{
      \   name: 'vimls',
      \   filetype: 'vim',
      \   path: 'vim-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'typescriptlang',
      \   filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
      \   path: 'typescript-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'jdtls',
      \   filetype: ['java'],
      \   path: 'jdtls',
      \   args: [],
      \ }
      \ ])

    " Lsp Info
    nnoremap <Leader>cl <Cmd>LspShowAllServers<CR>

    " Goto Definition
    nnoremap gd <Cmd>LspGotoDefinition<CR>

    " References
    nnoremap gr <Cmd>LspShowReferences<CR>

    " Goto Implementation
    nnoremap gI <Cmd>LspGotoImpl<CR>

    " Goto T[y]pe Definition
    nnoremap gy <Cmd>LspGotoTypeDef<CR>

    " Goto Declaration
    nnoremap gD <Cmd>LspGotoDeclaration<CR>

    " Hover
    nnoremap K <Cmd>LspHover<CR>

    " Signature Help
    nnoremap gK <Cmd>LspShowSignature<CR>
    inoremap <C-K> <Cmd>LspShowSignature<CR>

    " Code Action
    nnoremap <Leader>ca <Cmd>LspCodeAction<CR>
    xnoremap <Leader>ca <Cmd>LspCodeAction<CR>

    " Run Codelens
    nnoremap <Leader>cc <Cmd>LspCodeLens<CR>
    xnoremap <Leader>cc <Cmd>LspCodeLens<CR>

    " Rename
    nnoremap <Leader>cr <Cmd>LspRename<CR>

    " LSP Symbols
    nnoremap <Leader>ss <Cmd>LspDocumentSymbol<CR>
    
    " LSP Workspace Symbols
    nnoremap <Leader>sS <Cmd>LspSymbolSearch<CR>

    " C[a]lls Incoming
    nnoremap gai <Cmd>LspIncomingCalls<CR>

    " C[a]lls Outgoing
    nnoremap gao <Cmd>LspOutgoingCalls<CR>

    " Format
    nnoremap <Leader>cf <Cmd>LspFormat<CR>
    xnoremap <Leader>cf <Cmd>LspFormat<CR>

    " Diagnostics
    nnoremap <Leader>sd <Cmd>LspDiag show<CR>

    " Line Diagnostics
    nnoremap <Leader>cd <Cmd>LspDiag current<CR>

    " Next Diagnostic
    nnoremap ]d <Cmd>LspDiag next<CR>

    " Prev Diagnostic
    nnoremap [d <Cmd>LspDiag prev<CR>

    " Toggle Outline
    nnoremap <Leader>cs <Cmd>LspOutline<CR>

    " 커서 이동 시 현재 줄의 진단 메시지 출력
    augroup LspCustom
        autocmd!
        autocmd CursorMoved * silent! LspDiag! current
    augroup END
endif

