local vim = vim
local global=require('jw.global')
local lspconfig = require'lspconfig'
local lsp_status = require('lsp-status')
local log = require 'vim.lsp.log'
local util = require'jw.util'
local path = require'lspconfig/util'.path
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<localleader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<localleader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<localleader>=", [[<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$")+1,0})<CR>]], opts)
  end

        -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end




lsp_status.register_progress()



local on_attach_vim = function(client, bufnr)
  log.info("LSP starting")
  print("LSP starting")
  -- require('completion').on_attach(client, bufnr)
  -- require('diagnostic').on_attach(client, bufnr)
	on_attach(client, bufnr)
  log.info("LSP started")
  print("LSP started")
end

local on_attach_vim_go = function(client, bufnr)
  on_attach_vim(client, bufnr)
  vim.api.nvim_command[[autocmd BufWritePre *.go lua require'jw.util'.organize_imports_format()]]
  -- vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  -- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
end

local on_attach_vim_h = function(client, bufnr)
  on_attach_vim(client, bufnr)
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
-- npm install -g diagnostic-languageserver
--
--
-- yarn global add typescript typescript-language-server vscode-html-languageserver-bin vls vscode-css-languageserver-bin bash-language-server vscode-json-languageserver vim-language-server sql-language-server
--]]

lspconfig.tsserver.setup{
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
}

lspconfig.gopls.setup{
  on_attach=on_attach_vim_go,
  capabilities = capabilities, --lsp_status.capabilities,
}

lspconfig.html.setup{
  on_attach=on_attach_vim_h,
  capabilities = capabilities, --lsp_status.capabilities,
}
lspconfig.vuels.setup{
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
}
lspconfig.cssls.setup{
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
}

lspconfig.bashls.setup{
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
}

lspconfig.jsonls.setup{
  on_attach=on_attach_vim_h,
  init_options = {
    provideFormatter = true
  },
	-- commands = {
		-- Format = {
			-- function()
				-- vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			-- end
		-- }
	-- }
}

lspconfig.vimls.setup{
  on_attach=on_attach_vim,
}
lspconfig.sqlls.setup{
  on_attach=on_attach_vim,
}

lspconfig.sumneko_lua.setup{
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
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
  capabilities = capabilities, --lsp_status.capabilities,
}

lspconfig.jedi_language_server.setup {
  on_attach=on_attach_vim,
  capabilities = capabilities, --lsp_status.capabilities,
}
-- lspconfig.yamlls.setup{on_attach=on_attach_vim}

---[[
--
lspconfig.diagnosticls.setup{
  on_attach=on_attach_vim,
  autostart = false,
  capabilities = capabilities, --lsp_status.capabilities,
    filetypes = {"javascript", "typescript"},
    root_dir = function(fname)
      return lspconfig.util.root_pattern("tsconfig.json")(fname) or lspconfig.util.root_pattern(".eslintrc.js")(fname);
    end,
    init_options = {
      linters = {
        eslint = {
          command = "./node_modules/.bin/eslint",
          rootPatterns = {".eslintrc.js", ".git"},
          debounce = 100,
          args = {
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json"
          },
          sourceName = "eslint",
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "[eslint] ${message} [${ruleId}]",
            security = "severity"
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          }
        },
      },
      filetypes = {
        javascript = "eslint",
        typescript = "eslint"
      }
    }
  }

--]]



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
-- require('vim.lsp.diagnostic')._define_default_signs_and_highlights()
