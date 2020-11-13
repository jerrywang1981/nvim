
-- taken from https://github.com/nanotee/nvim-lua-guide
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

-- require'nvim-web-devicons'.setup{
  -- default = true;
-- }

require('lsp.lsp_config')
