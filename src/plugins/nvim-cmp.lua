vim.opt.completeopt = { "menu", "menuone", "popup", "noinsert", "noselect" }

local cmp = require("cmp")
local lspkind = require("lspkind")

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
