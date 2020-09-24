
-- taken from https://github.com/nanotee/nvim-lua-guide
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

require('lsp.lsp_config')
