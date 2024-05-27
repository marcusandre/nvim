return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "j-hui/fidget.nvim", opts = {} },

    -- Autoformatting
    "stevearc/conform.nvim",

    -- Schema information
    "b0o/SchemaStore.nvim",
  },
  config = function()
    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

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

      tsserver = {
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
      "prettier",
      "shfmt",
      "stylua",
      "tflint",
    }

    vim.list_extend(ensure_installed, servers_to_install)

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
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
        local builtin = require("telescope.builtin")
        local map = require("m.utils").map

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

        -- builtin
        map("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        map("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
        map("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        map("n", "grn", vim.lsp.buf.rename, { buffer = 0 })
        map("n", "grr", vim.lsp.buf.references, { buffer = 0 })
        map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
        map({ "n", "v" }, "gra", vim.lsp.buf.code_action, { buffer = 0 })

        -- telescope
        map("n", "<leader>ld", builtin.lsp_definitions, { buffer = 0, desc = "Definitions" })
        map("n", "<leader>le", vim.diagnostic.open_float, { buffer = 0, desc = "Diagnostics" })
        map("n", "<leader>li", builtin.lsp_implementations, { buffer = 0, desc = "Implementations" })
        map("n", "<leader>lr", builtin.lsp_references, { buffer = 0, desc = "References" })
        map("n", "<leader>ls", builtin.lsp_document_symbols, { buffer = 0, desc = "Symbols" })
        map("n", "<leader>lt", builtin.lsp_type_definitions, { buffer = 0, desc = "Type Definitions" })
        map("n", "<leader>lw", builtin.lsp_dynamic_workspace_symbols, { buffer = 0, desc = "Workspace Symbols" })

        local filetype = vim.bo[bufnr].filetype
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
        if disable_semantic_tokens[filetype] then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    })

    -- Autoformatting Setup
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettier" },
        typescript = { "eslint" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.keymap.set("n", "<leader>lf", "<Cmd>Format<CR>", { desc = "Format" })
  end,
}
