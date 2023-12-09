-- Neodev
require('neodev').setup()

-- Neodev
require('fidget').setup({})

-- Mason
require('mason').setup()

local servers = require('utils').lua_servers
local mason_lspconfig = require('mason-lspconfig')

local on_attach = function(client)
  if client.name == 'tsserver' then client.server_capabilities.documentFormattingProvider = false end
end

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- LSPConfig
local lspconfig = require('lspconfig')

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    })
  end,
})

-- TypeScript-Tools
require('typescript-tools').setup({
  settings = {
    expose_as_code_action = {
      'fix_all',
      'remove_unused',
      'add_missing_imports',
    },
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
