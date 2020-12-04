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
    clone_timeout = 600,
  },
}

return packer.startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'easymotion/vim-easymotion'
  use 'mhinz/vim-startify'
  use 'alvan/vim-closetag'
  use 'Yggdroot/indentLine'
  use 'jiangmiao/auto-pairs'
  use 'preservim/nerdcommenter'
  use 'kshenoy/vim-signature'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'airblade/vim-rooter'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'mbbill/undotree'
  use 'mattn/emmet-vim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'wellle/targets.vim'
  use 'editorconfig/editorconfig-vim'
  use 'itchyny/lightline.vim'
  use 'mengelbrecht/lightline-bufferline'
  -- use 'gruvbox-community/gruvbox'
  use 'mhartington/oceanic-next'
  use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'puremourning/vimspector'
  use 'szw/vim-maximizer'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  -- use 'jerrywang1981/nvim-util.lua'
  use 'junegunn/fzf.vim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'junegunn/fzf', run = ':call fzf#install()' }

  -- lazy loading
  use { 'junegunn/gv.vim', opt = true, cmd = { 'GV' } }
  use { 'kassio/neoterm', opt = true, cmd = { 'Ttoggle' } }
  use {'iamcco/markdown-preview.nvim', opt = true, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use { 'elzr/vim-json', opt = true, ft = { 'json' }}
  use { 'honza/dockerfile.vim', opt = true, ft = { 'Dockerfile' } }

end)
