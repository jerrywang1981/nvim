-- local vim = vim
-- local api = vim.api
-- local util = require'jw.util'


--[[
--color schema
--]]

-- vim.o.background = 'dark'
-- vim.g.oceanic_next_terminal_bold = 0
-- vim.g.oceanic_next_terminal_italic = 1
-- vim.cmd [[ colorscheme OceanicNext ]]

--[[
-- for auto-pairs
--]]
-- vim.g.AutoPairsMapCh = 0

--[[
--dev icons
--]]


--[[
--
-- nvim-treesitter
--]]
--[[
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
--]]

--[[
--fzf setting
--]]

-- util.map_key('n', '<c-p>', [[<cmd>Files<cr>]])
-- util.map_key('n', '<c-m>', [[<cmd>History<cr>]])
-- util.map_key('n', '<leader>fb', [[<cmd>Buffers<cr>]])
-- util.map_key('n', '<leader>fs', [[<cmd>Rg<cr>]])
-- util.map_key('x', '<leader>fs', [[:<c-w>Rg <c-r><c-w><cr>]])
-- vim.g.fzf_preview_window = {  'right:60%:hidden', 'ctrl-/' }


--[[
-- ================= emmet-vim ================
--]]

-- vim.g.user_emmet_install_global = 0
-- api.nvim_command [[ autocmd FileType html,css EmmetInstall ]]

--[[
-- undotree
--]]

-- util.map_key('n', '<space>5', [[ :UndotreeToggle<CR> ]])
-- vim.g.undotree_DiffAutoOpen = 1
-- vim.g.undotree_SetFocusWhenToggle = 1
-- vim.g.undotree_ShortIndicators = 1
-- vim.g.undotree_WindowLayout = 2
-- vim.g.undotree_DiffpanelHeight = 8
-- vim.g.undotree_SplitWidth = 24

--[[
--markdown-preview
--]]
-- vim.g.mkdp_auto_close = 1

