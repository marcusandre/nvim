---@diagnostic disable: missing-fields
return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "preview" }

      local lspkind = require("lspkind")
      local cmp = require("cmp")

      lspkind.init()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        experimental = {
          ghost_text = true,
        },
        sources = {
          { name = "snippets" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "lazydev", group_index = 0 },
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
            { "i", "c" }
          ),
        },
      })
    end,
  },
}
