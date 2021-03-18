local vim = vim
local api = vim.api


-- api.nvim_set_keymap('', [[\]], ',',  { noremap = true, silent = true })

-- nmap <Leader>ev <cmd>exe 'edit' $MYVIMRC<cr>
api.nvim_set_keymap('', '<leader>ev', [[<cmd>exe 'edit' $MYVIMRC<cr>]],  { noremap = true, silent = true })
--[[
--
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
--]]

api.nvim_set_keymap('', '<up>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('', '<down>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('', '<left>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('', '<right>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<up>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<down>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<left>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<right>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-h>', '<left>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-j>', '<down>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-k>', '<up>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-l>', '<right>',  { noremap = true, silent = true })

--[[
--
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
--]]
api.nvim_set_keymap('', '<c-j>', '<c-w>j',  { silent = true })
api.nvim_set_keymap('', '<c-k>', '<c-w>k',  { silent = true })
api.nvim_set_keymap('', '<c-l>', '<c-w>l',  { silent = true })
api.nvim_set_keymap('', '<c-h>', '<c-w>h',  { silent = true })
api.nvim_set_keymap('v', '<up>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('v', '<down>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('v', '<left>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('v', '<right>', '<Nop>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', 'jk', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('i', 'kj', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('v', 'jk', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('v', 'kj', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('c', 'jk', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('c', 'kj', '<esc>',  { noremap = true, silent = true })
api.nvim_set_keymap('c', '<c-p>', '<up>',  { noremap = true, silent = true })
api.nvim_set_keymap('c', '<c-n>', '<down>',  { noremap = true, silent = true })


api.nvim_set_keymap('n', '<space>4', ':<c-u>vertical botright Ttoggle<cr><C-w>l', { noremap = true, silent = true })
