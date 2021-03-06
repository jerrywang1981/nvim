local vim = vim
local dap = require('dap')
require('telescope').load_extension('dap')

vim.g.dap_virtual_text = true

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<F5>', [[<cmd>lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dj', [[<cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', [[<cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dh', [[<cmd>lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', [[<cmd>lua require'dap'.repl.open({}, 'vsplit')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>da', [[<cmd>lua require'jw.dap_config'.attach()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>di', [[<cmd>lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>de', [[<cmd>lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })




dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
     ----should we wait for delve to start???
    --vim.defer_fn(
    --function()
      --dap.repl.open()
      --callback({type = "server", host = "127.0.0.1", port = port})
    --end,
    --100)

      callback({type = "server", host = "127.0.0.1", port = port})
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  }
}



dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/repo/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

local function attach()
  print("attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

return {
  attach = attach,
}
