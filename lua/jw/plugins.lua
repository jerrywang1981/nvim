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

  use { 'joshdick/onedark.vim',
    config = [=[
      vim.o.background = 'dark'
      vim.g.onedark_terminal_italics = 1
      vim.api.nvim_command 'colorscheme onedark'
    ]=],
  }

  use { 'arcticicestudio/nord-vim', branch = 'develop',
    config = [=[
      -- vim.o.background = 'dark'
      -- vim.api.nvim_command 'colorscheme nord'
    ]=],
  }

  use { 'NLKNguyen/papercolor-theme',
    config = [=[
      -- vim.o.background = 'dark'
      -- vim.api.nvim_command 'colorscheme PaperColor'
    ]=],
  }

  use { 'mhartington/oceanic-next',
        config = [=[
          -- vim.o.background = 'dark'
          -- vim.g.oceanic_next_terminal_bold = 0
          -- vim.g.oceanic_next_terminal_italic = 1

          -- vim.api.nvim_command 'colorscheme OceanicNext'
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
	-- use { 'Yggdroot/indentLine' }
  use { 'jiangmiao/auto-pairs',
        config = [[
          vim.g.AutoPairsMapCh = 0
        ]]
      }
  use { 'mfussenegger/nvim-dap',
    requires = {
      { 'theHamsta/nvim-dap-virtual-text' }
    },
    config = [[
      require('jw.dap_config')
    ]],
  }
  use { 'szw/vim-maximizer', opt = true, cmd = { 'MaximizerToggle' },
    setup = [[
      vim.api.nvim_set_keymap('n', '<space>0', '<cmd>MaximizerToggle<cr>',  {  silent = true })
    ]],
    config = [[
      vim.g.maximizer_set_default_mapping = 0
    ]],
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

  use { 'junegunn/fzf.vim',
        requires = {
          { 'junegunn/fzf', run = ':call fzf#install()' },
        },
        config = [[
          -- vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Files<cr>', { silent = true })
          -- vim.api.nvim_set_keymap('n', '<c-m>', '<cmd>History<cr>', { silent = true })
          -- vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Buffers<cr>', { silent = true })
          -- vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Rg<cr>', { silent = true })
          -- vim.api.nvim_set_keymap('x', '<leader>fs', ':<c-w>Rg <c-r><c-w><cr>', { silent = true })
          vim.g.fzf_preview_window = {  'right:60%:hidden', 'ctrl-/' }
        ]],
    }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = [=[
        vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>lua require('telescope.builtin').find_files({previewer = false })<cr>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<c-m>', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>fS', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true })
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
  use { 'tpope/vim-fugitive',
    config = [=[
      vim.api.nvim_command [[ autocmd BufReadPost fugitive://* set bufhidden=delete ]]
      vim.api.nvim_command [[ autocmd User fugitive  if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |    nnoremap <buffer> .. :edit %:h<CR> |  endif ]]
    ]=],
  }
  use 'airblade/vim-gitgutter'
  use { 'mbbill/undotree', opt = true, cmd = { 'UndotreeToggle' },
        setup = [[
					vim.api.nvim_set_keymap('n', '<space>5', '<cmd>UndotreeToggle<CR>', { silent=true })
        ]],
        config = [=[
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
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      config = function() require'jw.statusline' end,
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  --[[
  use { 'itchyny/lightline.vim',
				config = [=[
          vim.g.lightline = {
            colorscheme = 'onedark',
            active = {
              left = {{'mode', 'paste'}, {'gitbranch', 'readonly', 'modified', 'jerry'}},
              right = { {'lineinfo'}, {'percent'}, {'fileformat','fileencoding', 'filetype'}, {'lspstatus'} },
            },
            inactive = {
              left = {{'mode', 'paste'} },
              right = { {'lineinfo'}, {'percent'} },
            },
            enable = {
              tabline = 0,
            },
            component = { jerry = '🧑  Jerry Wang' },
            component_function = {
              gitbranch = 'Branch',
              lspstatus = 'LspStatus',
            },
          }
				]=],
	}
    --]]
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons',
    config = [[
      require'bufferline'.setup{
        options = {
          numbers =  "both",
          number_style = { "superscript", "subscript" },
          mappings = true,
          separator_style = "slant",
        },
      }
      vim.api.nvim_set_keymap('n', '<leader>0', '<cmd>BufferLinePick<CR>',{ silent = true })
    ]],
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
  use {'SirVer/ultisnips', requires = { 'honza/vim-snippets' },
    config = [[
      vim.g.UltiSnipsExpandTrigger="<c-y>"
    ]],
  }
  use {'hrsh7th/nvim-compe', requires = {  'SirVer/ultisnips', 'honza/vim-snippets' },
    config = [=[
      vim.o.completeopt = "menuone,noselect"
      require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;

        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          ultisnips = true;
        };
      }
    ]=],
  }
  use {
        'neovim/nvim-lspconfig',
        requires = {
          'nvim-lua/lsp-status.nvim',
        },
      }
  use { 'kyazdani42/nvim-tree.lua', -- opt = true, cmd = { 'NvimTreeToggle' },
        requires = 'kyazdani42/nvim-web-devicons',
        setup = [[
					vim.api.nvim_set_keymap('n', '<space>1', '<cmd>NvimTreeToggle<CR>',{ silent = true })
        ]],
				config = [[
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
    requires = 'nvim-treesitter/nvim-treesitter-textobjects',
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
          enable = true,
          disable = { "elm" },
        },
        indent = {
          enable = true
        },

        textobjects = {
            select = {
              enable = true,
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                  python = "(function_definition) @function",
                  cpp = "(function_definition) @function",
                  c = "(function_definition) @function",
                  java = "(method_declaration) @function",
                },
              },
            },
          },

      }
      vim.api.nvim_exec([[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
      ]], true)
    ]=],
  }

  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- lazy loading
  use { 'junegunn/gv.vim', opt = true, cmd = { 'GV' } }
  use { 'kassio/neoterm', opt = true, cmd = { 'Ttoggle' },
    setup = [[
      vim.api.nvim_set_keymap('n', '<space>4', ':<c-u>vertical botright Ttoggle<cr><C-w>l', { noremap = true, silent = true })
    ]],
    config = [[
      vim.g.neoterm_autoscroll = 1
      vim.api.nvim_set_keymap('t', '<esc>', '<c-\\><c-n>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<c-v><esc>', '<esc>', { noremap = true, silent = true })
    ]]
  }
  use {'iamcco/markdown-preview.nvim',
		opt = true, run = 'cd app && yarn install',
		cmd = 'MarkdownPreview',
		config = [[
				vim.g.mkdp_auto_close = 1
		]],
	}

  use { 'npxbr/glow.nvim',
    opt = true,
    ft = {'markdown'},
    run = ':GlowInstall',
    cmd = 'Glow',
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
