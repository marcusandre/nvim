return {
  "echasnovski/mini.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = false,
  config = function()
    local map = require("m.utils").map
    local pick_modified_untracked = require("m.utils").pick_changed_files

    require("mini.extra").setup()
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

    map("n", "<leader>go", MiniDiff.toggle_overlay, { desc = "Toggle Overlay" })

    -- mini.bufremove
    local MiniBufremove = require("mini.bufremove")

    MiniBufremove.setup()

    map("n", "<leader>bd", MiniBufremove.delete, { desc = "Delete Buffer" })
    map("n", "<leader>bw", MiniBufremove.wipeout, { desc = "Wipeout Buffer" })
    map("n", "<leader>bo", "<Cmd>%bd|e#|bd#<CR>", { desc = "Delete Other Buffers" })

    -- mini.indentscope
    require("mini.indentscope").setup()

    -- mini.notify
    local MiniNotify = require("mini.notify")

    MiniNotify.setup({
      lsp_progress = {
        enable = false,
      },
    })

    -- mini.pick
    require("mini.pick").setup()

    vim.ui.select = MiniPick.ui_select

    MiniPick.registry.config = function()
      return MiniPick.builtin.files(nil, { source = { cwd = vim.fn.stdpath("config") } })
    end

    map("n", "<leader>/", "<Cmd>Pick buf_lines scope='current'<CR>", { desc = "Search buffer" })
    map("n", "<leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Buffers" })
    map("n", "<leader>fc", "<Cmd>Pick config<CR>", { desc = "Config" })
    map("n", "<leader>fF", "<Cmd>Pick files<CR>", { desc = "Files" })
    map("n", "<leader>ff", "<Cmd>Pick git_files<CR>", { desc = "Git files" })
    map("n", "<leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Grep live" })
    map("n", "<leader>fh", "<Cmd>Pick help<CR>", { desc = "Help" })
    map("n", "<leader>fo", "<Cmd>Pick oldfiles<CR>", { desc = "Oldfiles" })
    map("n", "<leader>fr", "<Cmd>Pick resume<CR>", { desc = "Resume" })
    map("n", "<leader>fs", "<Cmd>Pick git_hunks<CR>", { desc = "Git hunks" })
    map("n", "<leader>fS", pick_modified_untracked, { desc = "Git hunks" })
  end,
}
