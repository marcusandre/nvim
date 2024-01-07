return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
      { 'williamboman/mason.nvim', build = ':MasonUpdate', opts = {} },
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        severity_sort = true,
      },
      servers = {
        eslint = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = 'Replace' },
          },
        },
        rust_analyzer = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          checkOnSave = {
            allFeatures = true,
            command = 'clippy',
            extraArgs = { '--no-deps' },
          },
          procMacro = {
            enable = true,
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers),
      })

      local on_attach = function(client, bufnr)
        if client.name == 'tsserver' then client.server_capabilities.documentFormattingProvider = false end

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')
      end

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = opts.servers[server_name],
          })
        end,
      })

      vim.diagnostic.config(opts.diagnostics)
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
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
    },
  },
}
