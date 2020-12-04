local vim = vim

--[[
-- for auto-pairs
--]]
vim.g.AutoPairsMapCh = 0

--[[
--dev icons
--]]
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

--[[
--
-- nvim-treesitter
--]]
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
}
