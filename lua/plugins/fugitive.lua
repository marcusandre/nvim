return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Git" })
    vim.keymap.set("n", "g<space>", ":Git<Space>", { desc = "Git Command" })
    vim.keymap.set("n", "gX", "<Cmd>Gread<CR>", { desc = "Git Reset Buffer" })
    vim.keymap.set("n", "<leader>gl", "<Cmd>Git log --oneline<CR>", { desc = "Log" })
    vim.keymap.set("n", "<leader>gL", "<Cmd>Git log --oneline --follow -- %<CR>", { desc = "Log Buffer" })
    vim.keymap.set("n", "<leader>gb", "<Cmd>Git blame<CR>", { desc = "Blame" })

    local map = require("m.utils").map
    vim.api.nvim_create_autocmd("FileType", {

      pattern = { "fugitiveblame", "fugitive" },
      callback = function()
        map("n", "q", "<Cmd>quit<CR>", {
          buffer = 0,
        })
      end,
    })
  end,
}
