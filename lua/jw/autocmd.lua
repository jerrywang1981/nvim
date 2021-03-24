local vim = vim
local util = require'jw.util'

local autocmd_str = {
  [[ autocmd! TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500}) ]],
  [[ autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR> ]],
  [[ autocmd BufWritePre * %s/\s\+$//e ]],
  [[ autocmd BufWritePost plugins.lua PackerCompile ]],
  [[ autocmd BufReadPost fugitive://* set bufhidden=delete ]],
  [[ autocmd User fugitive  if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |    nnoremap <buffer> .. :edit %:h<CR> |  endif ]],
  [[ autocmd! VimLeave * call ClearLSPLog() ]],
}

util.set_autocmd_list(autocmd_str)


vim.api.nvim_exec([[

	function! OpenLSPLog() abort
		exe 'edit' v:lua.vim.lsp.get_log_path()
	endfunction

	function! ClearLSPLog() abort
		lua os.remove(vim.lsp.get_log_path())
	endfunction

]], false)

