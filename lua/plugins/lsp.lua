-- Neodev
require('neodev').setup()

-- Neodev
require('fidget').setup({})

-- Mason
require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

local on_attach = function(client)
  if client.name == 'tsserver' then client.server_capabilities.documentFormattingProvider = false end
end

local servers = {
  cssls = {},
  eslint = {},
  gopls = {},
  jsonls = {},
  lua_ls = { Lua = { runtime = { version = 'LuaJIT' }, telemetry = { enable = false } } },
  marksman = {},
  rust_analyzer = {},
  stylelint_lsp = {},
  terraformls = {},
  yamlls = {},
}

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

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = '',
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})

lspconfig.eslint.setup({
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })

    vim.keymap.set('n', '<leader>lf', '<Cmd>EslintFixAll<CR>', { desc = 'Format' })
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
