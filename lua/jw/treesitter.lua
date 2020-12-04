

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
  }, -- "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "elm" },  -- list of language that will be disabled
  },
}
