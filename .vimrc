" 색상
colorscheme catppuccin_mocha " 어두운 보라색의 색 구성표
set termguicolors " 24-bit 색상 사용

" 탭과 공백
set tabstop=4 " 탭 문자가 화면에서 차지하는 칸의 개수
set softtabstop=4 " 끼워넣기 모드에서 탭이 이동하는 크기
set shiftwidth=4 " 들여쓰기 연산의 크기
set expandtab " 탭 대신 공백으로 들여쓰기

" UI
set number " 줄 번호 표시
set relativenumber " 상대 줄 번호 표
set cursorline " 현재 위치한 줄 강조 표시
set lazyredraw " 필요한 경우에만 화면 갱신
set showmatch " 대응하는 괄호 쌍 강조
set colorcolumn=100,120 " 텍스트 정렬을 위한 강조선

" 검색
set incsearch " 문자 입력에 따른 즉각적 검색
set hlsearch " 검색 결과 강조

" 구문 강조
set regexpengine=0 " 정규 표현식 엔진 자동 선택

" LSP
if !has('ide') " Vim 또는 Neovim
    packadd lsp

    call LspAddServer([#{
        \   name: 'vimls',
        \   filetype: 'vim',
        \   path: 'vim-language-server',
        \   args: ['--stdio']
        \   }])

    call LspAddServer([#{
        \   name: 'typescriptlang',
        \   filetype: ['javascript', 'typescript'],
        \   path: 'typescript-language-server',
        \   args: ['--stdio']
        \   }])

    nnoremap <Leader>cf <Cmd>LspFormat<CR>
    xnoremap <Leader>cf <Cmd>LspFormat<CR>
    nnoremap <Leader>cd <Cmd>LspDiag current<CR>
    nnoremap ]d <Cmd>LspDiag nextWrap<CR>
    nnoremap [d <Cmd>LspDiag prevWrap<CR>

    nnoremap <Leader>cl <Cmd>LspShowAllServers<CR>
    nnoremap gd <Cmd>LspGotoDefinition<CR>
    nnoremap gr <Cmd>LspShowReferences<CR>
    nnoremap gI <Cmd>LspGotoImpl<CR>
    nnoremap gy <Cmd>LspGotoTypeDef<CR>
    nnoremap gD <Cmd>LspGotoDeclaration<CR>
    nnoremap K <Cmd>LspHover<CR>
    nnoremap gK <Cmd>LspShowSignature<CR>
    inoremap <C-K> <Cmd>LspShowSignature<CR>
    nnoremap <Leader>ca <Cmd>LspCodeAction<CR>
    xnoremap <Leader>ca <Cmd>LspCodeAction<CR>
    nnoremap <Leader>cc <Cmd>LspCodeLens<CR>
    xnoremap <Leader>cc <Cmd>LspCodeLens<CR>
    nnoremap <Leader>cr <Cmd>LspRename<CR>
    nnoremap ]] <Cmd>lnext<CR>
    nnoremap [[ <Cmd>lprev<CR>
    nnoremap <Leader>ss <Cmd>LspDocumentSymbol<CR>
    nnoremap <Leader>sS <Cmd>LspSymbolSearch<CR>
    nnoremap gai <Cmd>LspIncomingCalls<CR>
    nnoremap gao <Cmd>LspOutgoingCalls<CR>

    augroup LspCustom
        autocmd!
        autocmd CursorMoved * silent! LspDiag! current
    augroup END
endif

