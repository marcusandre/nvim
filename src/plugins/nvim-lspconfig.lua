local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then capabilities = require("cmp_nvim_lsp").default_capabilities() end

local lspconfig = require("lspconfig")

local servers = {
  dockerls = true,
  eslint = true,
  marksman = true,
  terraformls = true,
  zls = true,

  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  },

  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          unusedwrite = true,
          nilness = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },

  vtsls = {
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  },

  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  },
}

local servers_to_install = vim.tbl_keys(servers)

require("mason").setup()

vim.keymap.set("n", "<leader>sm", "<Cmd>Mason<CR>", { desc = "Mason" })

local ensure_installed = {
  "actionlint",
  "gofumpt",
  "goimports",
  "hadolint",
  "markdown-toc",
  "markdownlint",
  "prettier",
  "shfmt",
  "stylua",
  "tflint",
}

vim.list_extend(ensure_installed, servers_to_install)

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, config in pairs(servers) do
  if config == true then config = {} end
  config = vim.tbl_deep_extend("force", {}, {
    capabilities = capabilities,
  }, config)

  lspconfig[name].setup(config)
end

local disable_semantic_tokens = {
  lua = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = Config.map

    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

    map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
    map("n", "<leader>le", vim.diagnostic.open_float, { buffer = 0, desc = "Diagnostics" })
    map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = 0 })

    map("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>", { buffer = 0 })
    map("n", "<leader>ld", "<Cmd>Pick diagnostic<CR>", { buffer = 0, desc = "Diagnostics" })
    map("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>", { buffer = 0 })
    map("n", "gr", "<Cmd>Pick lsp scope='references'<CR>", { buffer = 0 })
    map("n", "<leader>li", "<Cmd>Pick lsp scope='implementation'<CR>", { buffer = 0, desc = "Implementations" })
    map("n", "<leader>ls", "<Cmd>Pick lsp scope='document_symbol'<CR>", { buffer = 0, desc = "Symbols" })
    map("n", "<leader>lt", "<Cmd>Pick lsp scope='type_definition'<CR>", { buffer = 0, desc = "Type Definitions" })
    map("n", "<leader>lw", "<Cmd>Pick lsp scope='workspace_symbol'<CR>", { buffer = 0, desc = "Workspace Symbols" })

    map("n", "<leader>lx", "<Cmd>lua vim.diagnostic.setloclist()<CR>", { buffer = 0, desc = "Diagnostics (Loclist)" })

    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = 0 })

    local filetype = vim.bo[bufnr].filetype
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
    if disable_semantic_tokens[filetype] then client.server_capabilities.semanticTokensProvider = nil end
  end,
})
