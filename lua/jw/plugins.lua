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
        config = [=[
          vim.o.background = 'dark'
          vim.g.oceanic_next_terminal_bold = 0
          vim.g.oceanic_next_terminal_italic = 1

          vim.api.nvim_command 'colorscheme OceanicNext'
        ]=],
      }

  use { 'easymotion/vim-easymotion',
			config = [=[
				vim.api.nvim_set_keymap('', '<leader>f', '<Plug>(easymotion-bd-f)',  {  silent = true })
				vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(easymotion-overwin-f)',  {  silent = true })
				vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)',  {  silent = true })
				vim.api.nvim_set_keymap('', [[<leader>/]], '<Plug>(easymotion-bd-w)',  {  silent = true })
				vim.api.nvim_set_keymap('n', [[<leader>/]], '<Plug>(easymotion-overwin-w)',  {  silent = true })
			]=],
			}
  use { 'mhinz/vim-startify',
				config = [=[
					vim.g.startify_change_to_vcs_root = 1
					vim.g.startify_change_to_dir = 0
					vim.g.startify_enable_special = 0
					vim.g.startify_lists = {{ type= 'files',     header= {'   MRU'}  } }
					local ascii = {
								 '       _                       __          __                  ',
								 [[      | |                      \ \        / /                  ]],
								 [[      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _    ]],
								 [[  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |   ]],
								 [[ | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |   ]],
								 [[  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |   ]],
								 [[                         __/ |                         __/ | * @jerrywang1981 github  ]],
								 [[                        |___/                         |___/  * https://jerrywang1981.github.io  ]],
								 [[                                                             * wangjianjun@gmail.com ]],
								 }
					vim.g.startify_custom_header = vim.fn['startify#center'](ascii)
					local footer = {
										 '春风杨柳万千条, 六亿神州尽舜尧',
										 '红雨随心翻作浪, 青山着意化为桥',
										 '天连五岭银锄落, 地动三河铁臂摇',
										 '借问瘟君欲何往, 纸船明烛照天烧',
										 '                               七律二首 送瘟神',
										 }
					vim.g.startify_custom_footer = vim.fn['startify#center'](footer)
				]=],
			}
  use 'alvan/vim-closetag'
  use 'puremourning/vimspector'
	-- use { 'Yggdroot/indentLine' }
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
  -- use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  use 'tpope/vim-surround'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = [=[
				vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', '<c-m>', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true })
				vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true })

				require('telescope').setup{
					defaults = {
					 preview_cutoff = 110,
					}
				}

		]=],
	}
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use { 'airblade/vim-rooter',
        config = [[
          vim.g.rooter_silent_chdir = 1
        ]] }
  use { 'tpope/vim-fugitive', opt = true, cmd = { 'Gstatus', 'Gdiff', 'Glog', 'Gblame' } }
  use 'airblade/vim-gitgutter'
  use { 'mbbill/undotree',
        config = [=[
					vim.api.nvim_set_keymap('n', '<space>5', ' :UndotreeToggle<CR>', { silent=true })
          vim.g.undotree_DiffAutoOpen = 1
          vim.g.undotree_SetFocusWhenToggle = 1
          vim.g.undotree_ShortIndicators = 1
          vim.g.undotree_WindowLayout = 2
          vim.g.undotree_DiffpanelHeight = 8
          vim.g.undotree_SplitWidth = 24
        ]=],
      }
  use { 'mattn/emmet-vim',
        config = [[
          vim.g.user_emmet_install_global = 0
          vim.api.nvim_command ' autocmd FileType html,css EmmetInstall '
        ]],
      }
  use 'wellle/targets.vim'
  use {'editorconfig/editorconfig-vim',
					config = [[
							vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
					]],
			}
  use { 'itchyny/lightline.vim',
				requires = 'mengelbrecht/lightline-bufferline',
				config = [=[
					vim.api.nvim_exec([[
						let g:lightline#bufferline#show_number  = 3
						let g:lightline#bufferline#shorten_path = 1
						let g:lightline#bufferline#enable_devicons = 0
						let g:lightline#bufferline#unnamed      = '[No Name]'
						let g:lightline#bufferline#number_map = {
							\ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
							\ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}
					]], false)
					vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>lightline#bufferline#go(1)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>lightline#bufferline#go(2)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>lightline#bufferline#go(3)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>lightline#bufferline#go(4)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>lightline#bufferline#go(5)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>lightline#bufferline#go(6)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>lightline#bufferline#go(7)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>lightline#bufferline#go(8)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>lightline#bufferline#go(9)', { silent = true })
					vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>lightline#bufferline#go(0)', { silent = true })
				]=],
	}
  use { 'haya14busa/incsearch.vim', requires = 'haya14busa/incsearch-fuzzy.vim',
				config = [=[
					vim.api.nvim_exec([[
						 if has('persistent_undo')
							 set undofile
							 set undodir=~/.config/nvim/tmp/undo,.
						 endif
					]], false)
					vim.g['incsearch#auto_nohlsearch'] = 1
					vim.api.nvim_set_keymap('', [[/]], '<Plug>(incsearch-forward)', {  silent = true })
					vim.api.nvim_set_keymap('', [[?]], '<Plug>(incsearch-backward)', {  silent = true })
					vim.api.nvim_set_keymap('', [[g/]], '<Plug>(incsearch-stay)', {  silent = true })
					vim.api.nvim_set_keymap('', 'n', '<Plug>(incsearch-nohl-n)', {  silent = true })
					vim.api.nvim_set_keymap('', 'N', '<Plug>(incsearch-nohl-N)', {  silent = true })
					vim.api.nvim_set_keymap('', [[*]], [[<Plug>(incsearch-nohl-*)]], {  silent = true })
					vim.api.nvim_set_keymap('', [[#]], [[<Plug>(incsearch-nohl-#)]], {  silent = true })
					vim.api.nvim_set_keymap('', [[g*]], [[<Plug>(incsearch-nohl-g*)]], {  silent = true })
					vim.api.nvim_set_keymap('', [[g#]], [[<Plug>(incsearch-nohl-g#)]], {  silent = true })
				]=],
	}
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
				config = [[
					vim.api.nvim_set_keymap('n', '<space>1', '<cmd>NvimTreeToggle<CR>',{ silent = true })
					vim.g.lua_tree_hide_dotfiles = 1
					vim.g.lua_tree_indent_markers = 1
	    	 	vim.g.lua_tree_ignore = { '.git', 'node_modules', '.cache', 'tmp', 'target', 'vendor' }
					vim.g.lua_tree_icons = { default='*' }

          require'nvim-web-devicons'.setup {
            override = {
              Dockerfile = {
                icon = "",
                color = "#cc3e44",
                name = "Dockerfile",
              },
              ["cmd"] = {
                icon = "",
                color = "#4d5a5e",
                name = "Cmd",
              },
              xml = {
                icon = "",
                color = "#e37933",
                name = "Xml",
              }
            }
          }

				]],
      }
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [=[
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "lua",
          "go",
          "graphql",
          "java",
          "javascript",
          "css",
          "python",
          "php",
          "c",
          "cpp",
          "json",
          "yaml",
          "typescript",
          "jsdoc",
          "vue",
          "html",
          "regex",
          "query",
          "bash",
          "toml",
          "css",
        },
        highlight = {
          enable = true,              -- false will disable the whole extension
          disable = { "elm" },  -- list of language that will be disabled
        },
        indent = {
          enable = true
        },
}
    ]=],
  }

  -- lazy loading
  use { 'junegunn/gv.vim', opt = true, cmd = { 'GV' } }
  use { 'kassio/neoterm', opt = true, cmd = { 'Ttoggle' } }
  use {'iamcco/markdown-preview.nvim',
		opt = true, run = 'cd app && yarn install',
		cmd = 'MarkdownPreview',
		config = [[
				vim.g.mkdp_auto_close = 1
		]],
	}

  use { 'elzr/vim-json',
        opt = true,
        ft = { 'json' },
        config = [[
          vim.g.vim_json_syntax_conceal = 0
        ]],
      }
  use { 'honza/dockerfile.vim', opt = true, ft = { 'Dockerfile' } }

end)
