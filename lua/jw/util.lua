local vim = vim
local api = vim.api
local M = {}

function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end


function M.set_autocmd_list(autocmd_list)
  for _, v in ipairs(autocmd_list) do
    api.nvim_command(v)
  end
end

--[[
--for lsp
--]]
function M.organize_imports (timeout_ms)
  timeout_ms = timeout_ms or 1000
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, 't', true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or vim.tbl_isempty(result) then return end
  _, result = next(result)
  if not result or vim.tbl_isempty(result) then return end
  result = result.result
  if not result or vim.tbl_isempty(result) then return end
  _, result = next(result)
  if not result or vim.tbl_isempty(result) then return end
  result = result.edit
  vim.lsp.util.apply_workspace_edit(result)
end

function M.organize_imports_format (timeout_ms)
  M.organize_imports(timeout_ms)
  vim.lsp.buf.formatting_sync(nil, timeout_ms or 1000)
end

--[[
-- key mapping/binding
--]]
function M.map_key(type, key, value, opts)
	vim.api.nvim_set_keymap(type, key, value, opts or {noremap = true, silent = true});
end

-- map key mapping for buffer
function M.map_buf_key(buf, type, key, value, opts)
	vim.api.nvim_buf_set_keymap(buf, type, key, value, opts or {noremap = true, silent = true});
end

function M.map_current_buf_key(type, key, value, opts)
  M.map_buf_key(0, type, key, value, opts)
end

return M
