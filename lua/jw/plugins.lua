local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  -- execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
local use = packer.use

packer.init{
  git = {
    clone_timeout = 1200,
  },
}

return packer.startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  use { 'mhartington/oceanic-next',
        config = [[
          vim.o.background = 'dark'
          vim.g.oceanic_next_terminal_bold = 0
          vim.g.oceanic_next_terminal_italic = 1
        ]],
      }

  use 'easymotion/vim-easymotion'
  use 'mhinz/vim-startify'
  use 'alvan/vim-closetag'
  use 'Yggdroot/indentLine'
  use { 'jiangmiao/auto-pairs',
        config = [[
          vim.g.AutoPairsMapCh = 0
        ]]
      }
  use {
        'preservim/nerdcommenter',
        config = [[
          vim.g.NERDSpaceDelims = 1
          vim.g.NERDCompactSexyComs = 1
          vim.g.NERDCommentEmptyLines = 1
          vim.g.NERDTrimTrailingWhitespace = 0
          vim.g.NERDToggleCheckAllLines = 1
        ]],
      }
  use 'kshenoy/vim-signature'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'airblade/vim-rooter'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use { 'mbbill/undotree',
        config = [[
          local util = require'jw.util'
          util.map_key('n', '<space>5', ' :UndotreeToggle<CR> ')
          vim.g.undotree_DiffAutoOpen = 1
          vim.g.undotree_SetFocusWhenToggle = 1
          vim.g.undotree_ShortIndicators = 1
          vim.g.undotree_WindowLayout = 2
          vim.g.undotree_DiffpanelHeight = 8
          vim.g.undotree_SplitWidth = 24
        ]],
      }
  use { 'mattn/emmet-vim',
        config = [[
          vim.g.user_emmet_install_global = 0
          vim.api.nvim_command ' autocmd FileType html,css EmmetInstall '
        ]],
      }
  use 'wellle/targets.vim'
  use 'editorconfig/editorconfig-vim'
  use { 'itchyny/lightline.vim', requires = 'mengelbrecht/lightline-bufferline' }
  use { 'haya14busa/incsearch.vim', requires = 'haya14busa/incsearch-fuzzy.vim'}
  use { 'nvim-lua/completion-nvim', requires = { 'SirVer/ultisnips', 'honza/vim-snippets' }}
  use {
        'neovim/nvim-lspconfig',
        requires = {
          'nvim-lua/completion-nvim',
          'nvim-lua/lsp-status.nvim',
        },
      }
  use { 'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
      }

  use { 'junegunn/fzf.vim',
        requires = {
          { 'junegunn/fzf', run = ':call fzf#install()' },
        },
        config = [[
          local util = require'jw.util'
          util.map_key('n', '<c-p>', '<cmd>Files<cr>')
          util.map_key('n', '<c-m>', '<cmd>History<cr>')
          util.map_key('n', '<leader>fb', '<cmd>Buffers<cr>')
          util.map_key('n', '<leader>fs', '<cmd>Rg<cr>')
          util.map_key('x', '<leader>fs', ':<c-w>Rg <c-r><c-w><cr>')
          vim.g.fzf_preview_window = {  'right:60%:hidden', 'ctrl-/' }
        ]],
      }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- lazy loading
  use { 'junegunn/gv.vim', opt = true, cmd = { 'GV' } }
  use { 'kassio/neoterm', opt = true, cmd = { 'Ttoggle' } }
  use {'iamcco/markdown-preview.nvim', opt = true, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use { 'elzr/vim-json',
        opt = true,
        ft = { 'json' },
      }
  use { 'honza/dockerfile.vim', opt = true, ft = { 'Dockerfile' } }

end)
