return {
  "epwalsh/obsidian.nvim",
  version = "*",
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
