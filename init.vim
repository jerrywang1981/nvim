filetype plugin indent on   " enable loading indent file for filetype
runtime macros/matchit.vim
syntax on                   " syntax highlighting
let g:solarized_termcolors=256
let mapleader=','
noremap \ ,
let maplocalleader=','

" filetype plugin indent on
set path+=**
set updatetime=500
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
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set suffixesadd=.java
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
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.

if !has('gui_running')
  set t_Co=256
  set t_ut=
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

" set background=dark
" colorscheme dracula
" colorscheme codedark

" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" let g:gruvbox_invert_selection='0'
set background=dark
" colorscheme dracula
" colorscheme gruvbox
let g:oceanic_next_terminal_bold = 0
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext



" ===============fzf settings, keep one only for fzf or leaderf =======
" export FZF_DEFAULT_COMMAND='rg --files'
noremap <silent> <c-p> <cmd>Files<cr>
noremap <silent> <c-m> <cmd>History<cr>
noremap <silent> <leader>fb <cmd>Buffers<cr>
noremap <silent> <leader>fs <cmd>Rg<cr>
xnoremap <silent> <leader>fs :<c-w>Rg <c-r><c-w><cr>
" let g:fzf_preview_window = ''
let g:fzf_preview_window = [ 'right:60%:hidden', 'ctrl-/']
" let g:fzf_layout = {'down': '30%'}



" ================markdown-preview==================
let g:mkdp_auto_close = 1

" =================editorconfig-vim===================
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" ===================== vim-json=================
let g:vim_json_syntax_conceal = 0

" =============== vim-fugitive===================
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" ===================rainbow=================
" let g:rainbow_active = 1

" ================= emmet-vim ================
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ================== vim-rooter =================
let g:rooter_silent_chdir = 1

" ==================== identLine =====================
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#338833'
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'netrw', 'packer']
let g:indentLine_fileTypeExclude = ['defx', 'netrw', 'denite', 'startify', 'tagbar', 'vista_kind', 'help', 'coc-explorer', 'packer']


" ================== easymotion ====================
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>/ <Plug>(easymotion-bd-w)
nmap <Leader>/ <Plug>(easymotion-overwin-w)

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


" -----------key mapping start------------
nmap <Leader>ev <cmd>exe 'edit' $MYVIMRC<cr>
" nmap <Leader>sv :so $MYVIMRC<cr>

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

inoremap jk <esc>
inoremap kj <esc>
vnoremap jk <esc>
vnoremap kj <esc>
cnoremap jk <esc>
cnoremap kj <esc>

" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
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
let g:netrw_preview=1
let g:netrw_winsize = 25


" =============================== nvim-tree.lua settings ===========================
nmap <silent> <space>1 <cmd>LuaTreeToggle<CR>
" let g:lua_tree_show_icons = {
    " \ 'git': 1,
    " \ 'folders': 1,
    " \ 'files': 1,
    " \ 'icon': 1,
    " \}
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache', 'tmp' ]
let g:lua_tree_hide_dotfiles = 1
let g:lua_tree_indent_markers = 1

let g:lua_tree_icons = {
    \ 'default': '*'
    \ }
    " \ 'symlink': '',
    " \ 'git': {
    " \   'unstaged': "✗",
    " \   'staged': "✓",
    " \   'unmerged': "",
    " \   'renamed': "➜",
    " \   'untracked': "★"
    " \   },
    " \ 'folder': {
    " \   'default': "",
    " \   'open': ""
    " \   }

"--------undo toggle---------

if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
noremap <silent> <space>5 :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24



" ======================= lightline ============================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'gitgutter'],['filename']],
      \   'right':[ ['lineinfo'],
      \             ['percent'],
      \             ['fileformat','fileencoding', 'filetype'],
      \             ['tnt'],
      \             ['lspstatus']
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
      \   'lspstatus': 'LspStatus',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'component_type': {'buffers': 'tabsel'},
      \ }

function! LightLineModified() abort
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

function! LightLineReadonly() abort
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

function! TNT() abort
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  let mode = get(map, mode()[0], mode()[0])
  let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
  let color = get(bgcolor, mode, bgcolor.n)
  exe printf('hi TNTColor ctermfg=196 ctermbg=%d guifg=#88ffff guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  return winwidth(0) > 70 ? 'Jerry Wang' : ''
endfunction

function! LightLineGitGutter() abort
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

function! LightLineFname() abort
  let icon = (strlen(&filetype) ? ' ' : 'no ft')
  let filename = LightLineFilename()
  let ret = [filename,icon]
  if filename == ''
    return ''
  endif
  return join([filename, icon],'')
endfunction

function! LightLineFilename() abort
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ': 'no ft') : ''
endfunction

function! LightLineFileformat() abort
  return winwidth(0) > 70 ? (&fileformat . ' ') : ''
endfunction

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
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


" =================== closetag ===============
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" ----- abbr
iab jwm Jerry Wang <jianjunw@cn.ibm.com>
iab jwgm Jerry Wang <wangjianjun@gmail.com>
iab <expr> dts strftime("%x")


function! OpenLSPLog() abort
  exe 'edit' v:lua.vim.lsp.get_log_path()
endfunction

function! ClearLSPLog() abort
  lua os.remove(vim.lsp.get_log_path())
endfunction

lua require('init')

function! NvimConfigPull() abort
  lua require'jw.global'.pull_config()
endfunction

function! NvimConfigPush() abort
  lua require'jw.global'.push_config()
endfunction


command! -nargs=0 OR :call v:lua.require('jw.util').organize_imports()<cr>


" ================= startify ==========================
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


" ========================= nerd-commenter =======================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" =============file explorer, eirther nerdtree or defx====================

" =================== nerdtree =================================
" noremap <silent> <leader><leader>1 :<c-u>NERDTreeToggle<CR>
" noremap <silent> <c-1> :<c-u>NERDTreeToggle<CR>
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDToggleCheckAllLines = 1



" ========================= neoterm setting =========================
if !has('nvim')
    set ttymouse=xterm2
endif

let g:neoterm_autoscroll = 1
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

if has('nvim')
  set inccommand=nosplit
  " tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  tnoremap <expr> ® '<C-\><C-N>"'.nr2char(getchar()).'pi'
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
"
" option key + 4
nnoremap <silent> <space>4 :<c-u>vertical botright Ttoggle<cr><C-w>l

" tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
" tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>
" tnoremap <silent> ¢ <C-\><C-n>:Ttoggle<cr>

" nnoremap <silent> <c-s>l :TREPLSendLine<CR>
" vnoremap <silent> <c-s>s :TREPLSendSelection<CR>


let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

nmap <leader>dd :call vimspector#Launch()<cr>
nmap <leader>dx :VimspectorReset<cr>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
