return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local utils = require("m.utils")
    local telesope = require("telescope")

    telesope.setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        fzf = {},
      },
    })

    telesope.load_extension("fzf")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy Find" })
    vim.keymap.set("n", "<leader>fQ", builtin.quickfixhistory, { desc = "Quickfix (history)" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Files (Git)" })
    vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume" })
    vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep string" })
    vim.keymap.set("n", "<space>fO", builtin.oldfiles, { desc = "Old Files (global)" })

    vim.keymap.set("n", "<space>fo", function()
      builtin.oldfiles({ only_cwd = true })
    end, { desc = "Old Files" })

    vim.keymap.set("n", "<space>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Open Config" })

    vim.keymap.set("n", "<space>fC", function()
      builtin.find_files({
        cwd = vim.fs.joinpath(vim.fn.expand("$HOME"), ".dotfiles"),
      })
    end, { desc = "Open Dotfiles" })

    vim.keymap.set("n", "<space>fS", utils.find_changed_files, { desc = "Git Files (changed)" })
    vim.keymap.set("n", "<space>fA", utils.git_co_authors, { desc = "Co-Authors" })
  end,
}
