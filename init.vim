filetype plugin indent on   " enable loading indent file for filetype
runtime macros/matchit.vim
syntax on                   " syntax highlighting
let g:solarized_termcolors=256
let mapleader=','
noremap \ ,
let maplocalleader=','

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.local/share/nvim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'neovim/nvim-lsp'
call plug#end()

filetype plugin indent on
syntax enable
set path+=**
set updatetime=5000
" set directory=~/tmp,/tmp
set foldmethod=indent
set foldlevel=99
set noswapfile
set autoindent
set encoding=utf-8
set clipboard+=unnamedplus  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
set number
set relativenumber
set showtabline=2
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set nowrap
set fileformat=unix
set cindent
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set scrolloff=5
set laststatus=2
set fenc=utf-8
set backspace=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase
set incsearch
set hlsearch
set expandtab
set whichwrap+=<,>,h,l
set autoread
set cursorline
set cursorcolumn
set history=200
set fixendofline
set diffopt+=vertical
set termguicolors
set visualbell
set hidden
set nobackup
set nowritebackup
set cmdheight=2


silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

if !has('gui_running')
  set t_Co=256
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

set background=dark
colorscheme dracula

" auto-pair
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 1

" vim-go
" let g:go_def_mapping_enabled = 0


" highlight yank
let g:highlightedyank_highlight_duration = 500

" nerdtree
noremap <silent> <leader><leader>1 :<c-u>NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" nerd-commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" goyo limelight
let g:goyo_width=100
let g:goyo_height=80
let g:goyo_linenr=1
nnoremap <silent> <leader><leader>0 :<c-u>Goyo<cr>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!



" fzf
noremap <silent> <c-p> :<c-u>Files<cr>
noremap <silent> <c-m> :<c-u>History<cr>
noremap <silent> <leader>fb :<c-u>Buffers<cr>
noremap <silent> <leader>fs :<c-u>Rg<cr>
xnoremap <silent> <leader>fs :<c-u>Rg <c-r><c-w><cr>


" markdown-preview
let g:mkdp_auto_close = 0

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" rainbow
let g:rainbow_active = 1

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-rooter
let g:rooter_silent_chdir = 1

" identLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#338833'
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_fileTypeExclude = ['defx', 'denite', 'startify', 'tagbar', 'vista_kind', 'help']


" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

" -----------key mapping start------------
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>

map <up> <Nop>
map <down> <Nop>
map <left> <Nop>
map <right> <Nop>
imap <up> <Nop>
imap <down> <Nop>
imap <left> <Nop>
imap <right> <Nop>
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

vmap <up> <Nop>
vmap <down> <Nop>
vmap <left> <Nop>
vmap <right> <Nop>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Ex command mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"------------key mapping end-------------

" --------------------netrw----------------"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"--------undo toggle---------
noremap <silent> <leader><leader>5 :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'gitgutter'],['filename', 'currentfunction']],
      \   'right':[ ['lineinfo'],
      \             ['percent'],
      \             ['fileformat','fileencoding', 'filetype'],
      \             ['tnt']
      \             ],
      \ },
      \ 'inactive': {
      \   'left': [['mode', 'paste'], ['filename']],
      \   'right':[['lineinfo'], ['percent']],
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']],
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \   'tnt': '%#TNTColor#%{TNT()}',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitgutter': 'LightLineGitGutter',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFname',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'component_type': {'buffers': 'tabsel'},
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &filetype == "defx"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

function! TNT()
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  let mode = get(map, mode()[0], mode()[0])
  let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
  let color = get(bgcolor, mode, bgcolor.n)
  exe printf('hi TNTColor ctermfg=196 ctermbg=%d guifg=#88ffff guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  return 'JERRY WANG'
endfunction

function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = ['+','~','-']
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! LightLineFname()
  let icon = (strlen(&filetype) ? ' ' : 'no ft')
  let filename = LightLineFilename()
  let ret = [filename,icon]
  if filename == ''
    return ''
  endif
  return join([filename, icon],'')
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ': 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ') : ''
endfunction

let g:lightline#bufferline#show_number  = 3
" let g:lightline#bufferline#min_buffer_count = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 0
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
  \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
  \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}


nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" nvim-lsp

" pip install python-language-server
"
"
" npm i -g bash-language-server vscode-css-languageserver-bin dockerfile-language-server-nodejs typescript-language-server vscode-html-languageserver-bin vscode-json-languageserver vls yaml-language-server vim-language-server
"
lua << EOF
  require'nvim_lsp'.gopls.setup{}
  require'nvim_lsp'.tsserver.setup{}
  require'nvim_lsp'.bashls.setup{}
  require'nvim_lsp'.cssls.setup{}
  require'nvim_lsp'.dockerls.setup{}
  require'nvim_lsp'.html.setup{}
  require'nvim_lsp'.jsonls.setup{}
  require'nvim_lsp'.vuels.setup{}
  require'nvim_lsp'.yamlls.setup{}
  require'nvim_lsp'.pyls.setup{}
  require'nvim_lsp'.vimls.setup{}
EOF


function! s:ConfigureBuffer()
    nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
    " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    " nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
    " nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
    " nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


    if exists('+signcolumn')
      setlocal signcolumn=yes
    endif
endfunction

" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=⚠
" sign define LspDiagnosticsInformationSign text=ℹ
" sign define LspDiagnosticsHintSign text=➤

if has('autocmd')
  augroup LanguageClientAutocmds
    autocmd!

    if exists('*nvim_open_win')
      autocmd BufEnter __LanguageClient__ call s:Bind()
    endif

    " autocmd FileType javascript,typescript,vim,go  call s:ConfigureBuffer()
    autocmd FileType * call s:ConfigureBuffer()
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
  augroup END
endif



" startify
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ ]
let g:ascii = [
      \ '       _                       __          __                  ',
      \ '      | |                      \ \        / /                  ',
      \ '      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _    ',
      \ '  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |   ',
      \ ' | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |   ',
      \ '  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |   ',
      \ '                         __/ |                         __/ | * @jerrywang1981 github  ',
      \ '                        |___/                         |___/  * https://jerrywang1981.github.io  ',
      \ '                                                             * wangjianjun@gmail.com ',
      \ ]
let g:startify_custom_header =
        \ startify#center(g:ascii)
let g:footer = [
          \ '春风杨柳万千条, 六亿神州尽舜尧',
          \ '红雨随心翻作浪, 青山着意化为桥',
          \ '天连五岭银锄落, 地动三河铁臂摇',
          \ '借问瘟君欲何往, 纸船明烛照天烧',
          \ '                               七律二首 送瘟神',
          \ ]
let g:startify_custom_footer =
        \ startify#center(g:footer)

