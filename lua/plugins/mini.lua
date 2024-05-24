return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.bracketed").setup()
    require("mini.cursorword").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.trailspace").setup()

    -- mini.diff
    local MiniDiff = require("mini.diff")

    MiniDiff.setup()

    vim.keymap.set("n", "<leader>go", MiniDiff.toggle_overlay, { desc = "Toggle Overlay" })

    -- mini.bufremove
    local utils = require("m.utils")
    local MiniBufremove = require("mini.bufremove")

    MiniBufremove.setup()

    vim.keymap.set("n", "<leader>bd", MiniBufremove.delete, { desc = "Delete Buffer" })
    vim.keymap.set("n", "<leader>bw", MiniBufremove.wipeout, { desc = "Wipeout Buffer" })
    vim.keymap.set("n", "<leader>ba", utils.delete_all_buffers, { desc = "Delete All Buffers" })
    vim.keymap.set("n", "<leader>bo", utils.delete_other_buffers, { desc = "Delete Other Buffers" })

    -- mini.indentscope
    require("mini.indentscope").setup()

    -- mini.notify
    local MiniNotify = require("mini.notify")

    MiniNotify.setup({
      lsp_progress = {
        enable = false,
      },
    })
  end,
}
