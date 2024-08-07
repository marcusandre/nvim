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
          maxInlayHintLength = 30,
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
    local nmap_leader = Config.nmap_leader
    local bufnr = args.buf
    local map = Config.map

    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

    map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
    map("n", "gD", "<Cmd>FzfLua lsp_declarations<CR>", { buffer = 0 })
    map("n", "gd", "<Cmd>FzfLua lsp_definitions<CR>", { buffer = 0 })
    map("n", "gr", "<Cmd>FzfLua lsp_references<CR>", { buffer = 0 })

    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = 0 })

    nmap_leader("<leader>ld", "<Cmd>FzfLua lsp_document_diagnostics<CR>", "Diagnostics", { buffer = 0 })
    nmap_leader("<leader>le", vim.diagnostic.open_float, "Diagnostics", { buffer = 0 })
    nmap_leader("<leader>li", "<Cmd>FzfLua lsp_implementations<CR>", "Implementations", { buffer = 0 })
    nmap_leader("<leader>lr", vim.lsp.buf.rename, "Rename", { buffer = 0 })
    nmap_leader("<leader>ls", "<Cmd>FzfLua lsp_document_symbols<CR>", "Symbols (buffer)", { buffer = 0 })
    nmap_leader("<leader>lt", "<Cmd>FzfLua lsp_typedefs<CR>", "Type Definitions", { buffer = 0 })
    nmap_leader("<leader>lw", "<Cmd>FzfLua lsp_live_workspace_symbols<CR>", "Symbols (workspace)", { buffer = 0 })
    nmap_leader("<leader>lx", "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics (LocList)", { buffer = 0 })

    local filetype = vim.bo[bufnr].filetype
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
    if disable_semantic_tokens[filetype] then client.server_capabilities.semanticTokensProvider = nil end
  end,
})
