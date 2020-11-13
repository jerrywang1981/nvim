local vim = vim
local global=require('global')
local nvim_lsp = require'nvim_lsp'
-- local lsp_status = require('lsp-status')
local nvim_util_mapping = require'nvim-util.mapping'
local map_current_buf_key = nvim_util_mapping.map_current_buf_key

-- lsp_status.register_progress()

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
  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

end



local on_attach_vim = function(client, bufnr)
  print("LSP starting")
  require('completion').on_attach(client, bufnr)
  require('diagnostic').on_attach(client, bufnr)
  -- lsp_status.on_attach(client, bufnr)

  -- map the buffer keys
  map_buf_keys()
  print("LSP started")
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go,*.ts,*.js,*.java lua vim.lsp.buf.formatting()]]
end

local on_attach_vim_go = function(client, bufnr)
  on_attach_vim(client, bufnr)
  vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
end

local on_attach_vim_h = function(client, bufnr)
  on_attach_vim(client, bufnr)
  map_current_buf_key('n','<localleader>=', '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<CR>')
end


nvim_lsp.tsserver.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}

nvim_lsp.gopls.setup{
  on_attach=on_attach_vim_go,
  -- capabilities = lsp_status.capabilities
}

-- nvim_lsp.gopls.setup{}
nvim_lsp.html.setup{
  on_attach=on_attach_vim_h,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.vuels.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.cssls.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}

nvim_lsp.bashls.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}

nvim_lsp.jsonls.setup{
  on_attach=on_attach_vim_h,
  init_options = {
    provideFormatter = true
  }
  -- capabilities = lsp_status.capabilities
}

nvim_lsp.vimls.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.sqlls.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}
-- nvim_lsp.sumneko_lua.setup{
  -- on_attach=on_attach_vim,
  -- cmd = {
    -- global.home.."/lua-language-server/bin/macOS/lua-language-server", "-E",
    -- global.home.."/lua-language-server/main.lua"
  -- },
-- }

-- nvim_lsp.jdtls.setup{}
nvim_lsp.jdtls.setup{
  on_attach=on_attach_vim,
  init_options={
    jvm_args = {
      "-javaagent:"..vim.loop.os_homedir().."/lombok.jar",
      "-XX:+UseG1GC",
      "-XX:+UseStringDeduplication",
      "-XX:ParallelGCThreads=8",
    },
  },
  root_dir=nvim_lsp.util.root_pattern(".git", "pom.xml", "build.xml"),
  -- capabilities = lsp_status.capabilities
}

nvim_lsp.jedi_language_server.setup{
  on_attach=on_attach_vim,
  -- capabilities = lsp_status.capabilities
}
-- nvim_lsp.yamlls.setup{on_attach=on_attach_vim}

local strategy = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_strategy_list = strategy;

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 1
vim.g.diagnostic_auto_popup_while_jump = 0
vim.g.space_before_virtual_text = 3

vim.g.completion_confirm_key = ""
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_ignore_case = 1
