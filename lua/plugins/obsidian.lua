if not vim.env.OBSIDIAN_VAULT_DIR then return {} end

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  keys = {
    { "<leader>og", "<Cmd>ObsidianSearch<CR>", desc = "Grep notes" },
    { "<leader>on", "<Cmd>ObsidianNew<CR>", desc = "New note" },
    { "<leader>ot", "<Cmd>ObsidianToday<CR>", desc = "Today" },
    { "<leader>oT", "<Cmd>ObsidianYesterday<CR>", desc = "Yesterday" },
  },
  event = {
    "BufReadPre " .. vim.env.OBSIDIAN_VAULT_DIR .. "/*.md",
    "BufNewFile " .. vim.env.OBSIDIAN_VAULT_DIR .. "/*.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("obsidian").setup({
      -- ui = { enable = false },
      workspaces = {
        {
          name = "vault",
          path = vim.env.OBSIDIAN_VAULT_DIR,
        },
      },
    })
  end,
}
