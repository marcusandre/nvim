return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Git" })
    vim.keymap.set("n", "g<space>", ":Git<Space>", { desc = "Git Command" })
    vim.keymap.set("n", "gX", "<Cmd>Gread<CR>", { desc = "Git Reset Buffer" })
    vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>", { desc = "Log" })
    vim.keymap.set("n", "<leader>gL", ":Git log --oneline --follow -- %<CR>", { desc = "Log Buffer" })
  end,
}
