local vim = vim
local global=require('global')
local lspconfig = require'lspconfig'
local log = require 'vim.lsp.log'
local nvim_util_mapping = require'nvim-util.mapping'
local map_current_buf_key = nvim_util_mapping.map_current_buf_key


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
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  map_current_buf_key('n','<localleader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')
  map_current_buf_key('n','<localleader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')


  -- diagnostics setting
  map_current_buf_key('n', '<space>d', '<cmd>OpenDiagnostic<cr>')
  map_current_buf_key('n', '[g', '<cmd>PrevDiagnostic<cr>')
  map_current_buf_key('n', ']g', '<cmd>NextDiagnostic<cr>')

  map_current_buf_key('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- map_current_buf_key('n', '<space>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
  -- vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

end




local on_attach_vim = function(client, bufnr)
  log.info("LSP starting")
  require('completion').on_attach(client, bufnr)
  -- require('diagnostic').on_attach(client, bufnr)

  -- map the buffer keys
  map_buf_keys()
  log.info("LSP started")
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go,*.ts,*.js,*.java lua vim.lsp.buf.formatting()]]
end

local on_attach_vim_go = function(client, bufnr)
  on_attach_vim(client, bufnr)
  vim.api.nvim_command[[autocmd BufWritePre *.go lua require'nvim-util.actions'.organize_imports_format()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
end

local on_attach_vim_h = function(client, bufnr)
  on_attach_vim(client, bufnr)
  map_current_buf_key('n','<localleader>=', '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<CR>')
end


lspconfig.tsserver.setup{
  on_attach=on_attach_vim,
}

lspconfig.gopls.setup{
  on_attach=on_attach_vim_go,
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
   -- cmd = {
     -- global.nvim_cache_dir .. "nvim_lsp/sumneko_lua/lua-language-server/bin/" .. (global.is_linux and "Linux" or "macOS") .."/lua-language-server", "-E",
     -- global.nvim_cache_dir .. "nvim_lsp/sumneko_lua/lua-language-server/main.lua"
   -- },
}

-- lspconfig.jdtls.setup{}
lspconfig.jdtls.setup{
  on_attach=on_attach_vim,
  init_options={
    jvm_args = {
      "-javaagent:"..vim.loop.os_homedir().."/lombok.jar",
      "-XX:+UseG1GC",
      "-XX:+UseStringDeduplication",
      "-XX:ParallelGCThreads=8",
    },
  },
  root_dir=lspconfig.util.root_pattern(".git", "pom.xml", "build.xml"),
}

lspconfig.jedi_language_server.setup {
  on_attach=on_attach_vim,
}
-- lspconfig.yamlls.setup{on_attach=on_attach_vim}

local strategy = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_strategy_list = strategy;

-- vim.g.diagnostic_enable_virtual_text = 1
-- vim.g.diagnostic_enable_underline = 1
-- vim.g.diagnostic_auto_popup_while_jump = 0
-- vim.g.space_before_virtual_text = 3

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
