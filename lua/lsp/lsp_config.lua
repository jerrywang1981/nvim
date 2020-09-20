local global=require('global')
local vim = vim


local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local map_buf_keys = function()
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','<localleader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  map('n','<localleader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n','<localleader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')



  -- diagnostics setting
  map('n', '<space>d', ':<C-u>OpenDiagnostic<cr>')
  map('n', '[g', ':<C-u>PrevDiagnostic<cr>')
  map('n', ']g', ':<C-u>NextDiagnostic<cr>')

  map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end



local on_attach_vim = function(client)
  print("LSP started")
  require('completion').on_attach(client)
  require('diagnostic').on_attach(client)

  -- map the buffer keys
  map_buf_keys()
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
  vim.api.nvim_command[[autocmd BufWritePre *.go,*.ts,*.js lua vim.lsp.buf.formatting()]]
end

require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
require'nvim_lsp'.gopls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.html.setup{on_attach=on_attach_vim}
require'nvim_lsp'.cssls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sqlls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sumneko_lua.setup{
  on_attach=on_attach_vim,
  cmd = {
    global.home.."/lua-language-server/bin/macOS/lua-language-server", "-E",
    global.home.."/lua-language-server/main.lua"
  }
}
-- require'nvim_lsp'.jdtls.setup{on_attach=on_attach_vim}
--
--



local strategy = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_strategy_list = strategy;

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_auto_popup_while_jump = 0
vim.g.space_before_virtual_text = 3

