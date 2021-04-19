local vim = vim
-- https://oroques.dev/notes/neovim-init/
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

--[[
--global options
--]]
opt('o', 'updatetime',  500)
opt('o', 'showtabline',  2)
opt('o', 'laststatus',  2)
opt('o', 'showmatch',  true)
opt('o', 'showmode',  false)
opt('o', 'mouse',  'a')
opt('o', 'selection',  'exclusive')
opt('o', 'ignorecase',  true)
opt('o', 'incsearch',  true)
opt('o', 'hlsearch',  true)
opt('o', 'history',  2000)
opt('o', 'visualbell',  true)
opt('o', 'hidden',  true)
opt('o', 'backup',  false)
opt('o', 'writebackup',  true)
-- opt('o', 'cmdheight',  2)
opt('o', 'termguicolors',  true)
opt('o', 'encoding',  'utf-8')
opt('o', 'scrolloff',  5)

--[[
--window options
--]]
opt('w', 'relativenumber',  true)
opt('w', 'number',  true)
opt('w', 'wrap',  false)
opt('w', 'foldmethod',  'indent')
opt('w', 'foldlevel',  99)
opt('w', 'cursorline',  true)
opt('w', 'cursorcolumn',  true)
opt('w', 'signcolumn',  'yes')
opt('w', 'colorcolumn',  '80')

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


opt('b', 'swapfile', false)
opt('b', 'autoindent', true)
opt('b', 'cindent', true)

opt('b', 'tabstop', 2)
opt('b', 'softtabstop', 2)
opt('b', 'shiftwidth', 2)
opt('b', 'expandtab', false)

opt('b', 'fileformat', 'unix')
opt('b', 'fileencoding', 'utf-8')
opt('b', 'autoread', true)
opt('b', 'fixendofline', true)

-- vim.cmd [[ set noswapfile ]]
-- vim.cmd [[ set autoindent ]]
-- vim.cmd [[ set cindent ]]

-- vim.cmd [[ set tabstop=2 ]]
-- vim.cmd [[ set softtabstop=2 ]]
-- vim.cmd [[ set shiftwidth=2 ]]
-- vim.cmd [[ set noexpandtab ]]

-- vim.cmd [[ set fileformat=unix ]]
-- vim.cmd [[ set fileencoding='utf-8' ]]
-- vim.cmd [[ set autoread ]]
-- vim.cmd [[ set fixendofline ]]

