return {
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = true,
      },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      -- Neodev
      require('neodev').setup()

      -- Mason
      require('mason').setup()

      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local servers = require('m.lsp').lua_servers

      local on_attach = function(client)
        if client.name == 'tsserver' then client.server_capabilities.documentFormattingProvider = false end
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })
    end,
  },
}
