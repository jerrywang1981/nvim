local vim = vim
local global=require('jw.global')
local lspconfig = require'lspconfig'
local lsp_status = require('lsp-status')
local log = require 'vim.lsp.log'
local util = require'jw.util'
local path = require'lspconfig/util'.path
local map_current_buf_key = util.map_current_buf_key

lsp_status.register_progress()

local map_buf_keys = function()
  map_current_buf_key('n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map_current_buf_key('n','<c-]>','<cmd>lua vim.lsp.buf.definition()<CR>')
	map_current_buf_key('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map_current_buf_key('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  -- map('n','<c-k>','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map_current_buf_key('n','<localleader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- map_current_buf_key('n','<localleader>ld','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map_current_buf_key('n','<localleader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')
  map_current_buf_key('n','<localleader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')


  -- diagnostics setting
  map_current_buf_key('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>')
  map_current_buf_key('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
  map_current_buf_key('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')

  map_current_buf_key('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- map_current_buf_key('n', '<space>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
  -- vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

end




local on_attach_vim = function(client, bufnr)
  log.info("LSP starting")
  print("LSP starting")
  require('completion').on_attach(client, bufnr)
  -- require('diagnostic').on_attach(client, bufnr)

  -- map the buffer keys
  map_buf_keys()
  log.info("LSP started")
  print("LSP started")
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go,*.ts,*.js,*.java lua vim.lsp.buf.formatting()]]
end

local on_attach_vim_go = function(client, bufnr)
  on_attach_vim(client, bufnr)
  vim.api.nvim_command[[autocmd BufWritePre *.go lua require'jw.util'.organize_imports_format()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
end

local on_attach_vim_h = function(client, bufnr)
  on_attach_vim(client, bufnr)
  map_current_buf_key('n','<localleader>=', '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$")+1,0})<CR>')
end

--[[
-- npm install -g typescript typescript-language-server
-- npm install -g vscode-html-languageserver-bin
-- npm install -g vls
-- npm install -g vscode-css-languageserver-bin
-- npm install -g bash-language-server
-- npm install -g vscode-json-languageserver
-- npm install -g vim-language-server
-- npm install -g sql-language-server
--
--
-- yarn global add typescript typescript-language-server vscode-html-languageserver-bin vls vscode-css-languageserver-bin bash-language-server vscode-json-languageserver vim-language-server sql-language-server
--]]

lspconfig.tsserver.setup{
  on_attach=on_attach_vim,
  capabilities = lsp_status.capabilities,
}

lspconfig.gopls.setup{
  on_attach=on_attach_vim_go,
  capabilities = lsp_status.capabilities,
}

lspconfig.html.setup{
  on_attach=on_attach_vim_h,
}
lspconfig.vuels.setup{
  on_attach=on_attach_vim,
}
lspconfig.cssls.setup{
  on_attach=on_attach_vim,
}

lspconfig.bashls.setup{
  on_attach=on_attach_vim,
}

lspconfig.jsonls.setup{
  on_attach=on_attach_vim_h,
  init_options = {
    provideFormatter = true
  }
}

lspconfig.vimls.setup{
  on_attach=on_attach_vim,
}
lspconfig.sqlls.setup{
  on_attach=on_attach_vim,
}

lspconfig.sumneko_lua.setup{
  on_attach=on_attach_vim,
  capabilities = lsp_status.capabilities,
   -- cmd = {
     -- global.nvim_cache_dir .. "nvim_lsp/sumneko_lua/lua-language-server/bin/" .. (global.is_linux and "Linux" or "macOS") .."/lua-language-server", "-E",
     -- global.nvim_cache_dir .. "nvim_lsp/sumneko_lua/lua-language-server/main.lua"
   -- },
}


-- for jdtls
local get_os_config = function ()
  if vim.fn.has("osx") == 1 then
    return "config_mac"
  elseif vim.fn.has("unix") == 1 then
    return "config_linux"
  else
    return "config_win"
  end
end

local install_dir = global.vim_path .. global.path_sep .. "f" .. global.path_sep .. "jdtls"

lspconfig.jdtls.setup{
  on_attach=on_attach_vim,
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xmx1G",
    "-javaagent:" .. global.vim_path .. global.path_sep .. "f" .. global.path_sep .. "lombok.jar",
    "-XX:+UseG1GC",
    "-XX:+UseStringDeduplication",
    "-XX:ParallelGCThreads=8",
    "-jar", install_dir .. "/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar",
    "-configuration", path.join { install_dir, get_os_config() },
    "-data", path.join { vim.loop.os_homedir(), "workspace" },
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED"
  },
  -- init_options={
    -- jvm_args = {
      -- "-javaagent:" .. global.vim_path .. global.path_sep .. "f" .. global.path_sep .. "lombok.jar",
      -- "-XX:+UseG1GC",
      -- "-XX:+UseStringDeduplication",
      -- "-XX:ParallelGCThreads=8",
    -- },
  -- },
  root_dir=lspconfig.util.root_pattern(".git", "pom.xml", "build.xml"),
  capabilities = lsp_status.capabilities,
}

lspconfig.jedi_language_server.setup {
  on_attach=on_attach_vim,
  capabilities = lsp_status.capabilities,
}
-- lspconfig.yamlls.setup{on_attach=on_attach_vim}

local strategy = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_strategy_list = strategy;


vim.g.completion_confirm_key = ""
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_ignore_case = 1



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
  underline = true,

   -- Enable virtual text, override spacing to 4
   virtual_text = {
     spacing = 0,
   },
   -- Disable a feature
   update_in_insert = false,
 }
)

vim.cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() ]]
-- load default highlight group for diagnostics
require('vim.lsp.diagnostic')._define_default_signs_and_highlights()
