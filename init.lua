--[[

       _                       __          __
      | |                      \ \        / /
      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _
  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |
 | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |
  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |
                         __/ |                         __/ | * @jerrywang1981 github  ',
                        |___/                         |___/  * https://jerrywang1981.github.io  ',
                                                             * wangjianjun@gmail.com ',

--]]

local vim = vim

vim.lsp.set_log_level(0)

vim.g.solarized_termcolors=256
vim.g.mapleader=','
vim.g.maplocalleader=','
vim.api.nvim_set_keymap('', [[\]], [[,]],  { noremap = true, silent = true })


vim.api.nvim_exec([[
filetype plugin indent on   " enable loading indent file for filetype
syntax on                   " syntax highlighting

set path+=**
set clipboard+=unnamedplus  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set selectmode=mouse,key
set whichwrap+=<,>,h,l
set diffopt+=vertical
set completeopt=menuone,noinsert,noselect
set shortmess+=c


silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.

if !has('gui_running')
  set t_Co=256
  set t_ut=
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

]], false)

require('jw.keymapping')
require('jw.plugins')
require('jw.option')
require('jw.autocmd')
require('jw.lsp_config')




