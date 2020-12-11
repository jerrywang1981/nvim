local vim = vim
local api = vim.api

--[[
--global options
--]]
vim.o.updatetime = 500
vim.o.showtabline = 2
vim.o.laststatus = 2
vim.o.showmatch = true
vim.o.mouse = 'a'
vim.o.selection = 'exclusive'
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.history = 2000
vim.o.visualbell = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = true
vim.o.cmdheight = 2
vim.o.termguicolors = true
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 5

--[[
--window options
--]]
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = false
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 99
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.signcolumn = 'yes'
vim.wo.colorcolumn = '80'

--[[
--buffer options
--]]

-- vim.o.swapfile = false
-- vim.o.autoindent = true
-- vim.o.cindent = true
-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2
-- vim.o.softtabstop = 2
-- vim.o.fileformat = 'unix'
-- vim.o.fileencoding = 'utf-8'
-- vim.o.expandtab = true
-- vim.o.autoread = true
-- vim.o.fixendofline = true


vim.cmd [[ set noswapfile ]]
vim.cmd [[ set autoindent ]]
vim.cmd [[ set cindent ]]
vim.cmd [[ set tabstop=2 ]]

vim.cmd [[ set shiftwidth=2 ]]
vim.cmd [[ set softtabstop=2 ]]
vim.cmd [[ set fileformat=unix ]]
vim.cmd [[ set fileencoding='utf-8' ]]
vim.cmd [[ set expandtab ]]
vim.cmd [[ set autoread ]]
vim.cmd [[ set fixendofline ]]

