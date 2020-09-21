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
Plug 'alvan/vim-closetag'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'tpope/vim-repeat'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'honza/dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm', { 'on': 'Ttoggle'}
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" filetype plugin indent on
set path+=**
set updatetime=500
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
" set backspace=2
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

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
set background=dark
" colorscheme dracula
" colorscheme nord
colorscheme gruvbox

" for quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" auto-pair
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 1



" ======================== goyo limelight =======================
let g:goyo_width=100
let g:goyo_height=80
let g:goyo_linenr=1
nnoremap <silent> <leader><leader>0 :<c-u>Goyo<cr>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" autocmd
" autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e



autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})

" =============== either fzf or leaderf, keey one =====================

" ===============fzf settings, keep one only for fzf or leaderf =======
" noremap <silent> <c-p> :<c-u>Files<cr>
" noremap <silent> <c-m> :<c-u>History<cr>
" noremap <silent> <leader>fb :<c-u>Buffers<cr>
" noremap <silent> <leader>fs :<c-u>Rg<cr>
" xnoremap <silent> <leader>fs :<c-u>Rg <c-r><c-w><cr>
" let g:fzf_preview_window = ''

" ==============leaderf settigs, keep one only for leader or fzf=============
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShowDevIcons=0

let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<c-p>"
let g:Lf_ShortcutB = "<leader>fb"
noremap <c-m> :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf rg --stayOpen %s", "")<CR><CR>
xnoremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg --stayOpen -F -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>fS :<C-U>Leaderf! rg --recall<CR>

let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_PythonVersion=3
let g:Lf_WindowHeight = 0.3
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'

let g:Lf_WildIgnore = {
  \ 'dir': ['.svn','.git','.hg', 'node_modules', 'dist', 'venv'],
  \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
  \}
let g:Lf_MruWildIgnore = {
  \ 'dir': ['.svn','.git','.hg', 'node_modules', 'dist', 'venv'],
  \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
  \}
let g:Lf_RgConfig = [
  \ "--max-columns=300",
  \ "--glob=!node_modules/*",
  \ "--glob=!venv/*",
  \ "--glob=!dist/*",
  \ ]




" ================markdown-preview==================
let g:mkdp_auto_close = 0

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
let g:rainbow_active = 1

" ================= emmet-vim ================
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ================== vim-rooter =================
let g:rooter_silent_chdir = 1

" ==================== identLine =====================
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#338833'
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'netrw']
let g:indentLine_fileTypeExclude = ['defx', 'netrw', 'denite', 'startify', 'tagbar', 'vista_kind', 'help', 'coc-explorer']


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
nmap <silent> ¡ :<c-u>LuaTreeToggle<CR>
nmap <silent> <leader><leader>1 :<c-u>LuaTreeToggle<CR>
let g:lua_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \}
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache', 'tmp' ]
let g:lua_tree_hide_dotfiles = 1

"--------undo toggle---------

if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
noremap <silent> <leader><leader>5 :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24



autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" ======================= lightline ============================
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



" ---------- coc.nvim----------
let g:coc_disable_startup_warning=1
let g:coc_global_extensions = ['coc-pairs', 'coc-snippets', 'coc-emmet', 'coc-yank', 'coc-lists']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()

" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? coc#_select_confirm() :
      " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> <localleader>gd <Plug>(coc-definition)
" nmap <silent> <localleader>gy <Plug>(coc-type-definition)
" nmap <silent> <localleader>gi <Plug>(coc-implementation)
" nmap <silent> <localleader>gr <Plug>(coc-references)
" nmap <silent> <localleader>rn <Plug>(coc-rename)


" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
  " autocmd!
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" show all actions
" nnoremap <silent><nowait> <space>a  :<C-u>CocList actions<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" nnoremap <silent><nowait> <space>e :<c-u>CocCommand explorer<CR>

" nmap <space>e :CocCommand explorer<CR>
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.go :call CocAction('format')
" ---------- end of coc


" ----- abbr
iab jwm Jerry Wang <jianjunw@cn.ibm.com>
iab jwgm Jerry Wang <wangjianjun@gmail.com>
iab <expr> dts strftime("%x")


" nvim-lsp

" pip install python-language-server
"
"
" npm i -g bash-language-server vscode-css-languageserver-bin dockerfile-language-server-nodejs typescript-language-server vscode-html-languageserver-bin vscode-json-languageserver vls yaml-language-server vim-language-server
"
" lua << EOF
  " require'nvim_lsp'.gopls.setup{}
  " require'nvim_lsp'.tsserver.setup{}
  " require'nvim_lsp'.bashls.setup{}
  " require'nvim_lsp'.cssls.setup{}
  " require'nvim_lsp'.dockerls.setup{}
  " require'nvim_lsp'.html.setup{}
  " require'nvim_lsp'.jsonls.setup{}
  " require'nvim_lsp'.vuels.setup{}
  " require'nvim_lsp'.yamlls.setup{}
  " require'nvim_lsp'.pyls.setup{}
  " require'nvim_lsp'.vimls.setup{}
" EOF

lua require('init')
" completion-nvim
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:diagnostic_enable_virtual_text = 1
" let g:diagnostic_auto_popup_while_jump = 0
" let g:space_before_virtual_text = 3

" function! LSPRename()
    " let s:newName = input('Enter new name: ', expand('<cword>'))
    " echom "s:newName = " . s:newName
    " lua vim.lsp.buf.rename(s:newName)
" endfunction


function! s:ConfigureBuffer()
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
  " nnoremap <silent> <localleader>gD    <cmd>lua vim.lsp.buf.declaration()<CR>
  " nnoremap <silent> <localleader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
  " nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  " nnoremap <silent> <localleader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
  " nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  " nnoremap <silent> <localleader>gr    <cmd>lua vim.lsp.buf.references()<CR>

  " nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  " nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

  " nnoremap <silent><nowait> <space>d  :<C-u>OpenDiagnostic<cr>
  " nnoremap <silent> [g :<C-u>PrevDiagnostic<cr>
  " nnoremap <silent> ]g :<C-u>NextDiagnostic<cr>
endfunction

" if has('autocmd')
  " augroup LanguageClientAutocmds
    " autocmd!
"
    " if exists('*nvim_open_win')
      " autocmd BufEnter __LanguageClient__ call s:Bind()
    " endif
"
    " autocmd FileType sh,go,c,typescript,javascript call s:ConfigureBuffer()
    " autocmd BufWritePre *.go,*.ts,*.js lua vim.lsp.buf.formatting()
  " augroup END
" endif



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
nnoremap <silent> ¢ :vertical botright Ttoggle<cr><C-w>l
nnoremap <silent> <leader><leader>4 :<c-u>vertical botright Ttoggle<cr><C-w>l

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
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<cr>
