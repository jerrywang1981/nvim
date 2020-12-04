local vim = vim
-- taken from https://github.com/nanotee/nvim-lua-guide
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end


vim.lsp.set_log_level(0)

require('jw.plugins')

require('jw.lsp_config')
require('jw.treesitter')
require('jw.devicons')
