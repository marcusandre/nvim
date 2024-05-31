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
      defaults = {
        path_display = { "truncate" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        git_status = {
          show_untracked = true,
          layout_strategy = "vertical",
        },
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        fzf = {},
      },
    })

    telesope.load_extension("fzf")

    local map = require("m.utils").map
    local builtin = require("telescope.builtin")

    map("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy Find" })
    map("n", "<leader>fQ", builtin.quickfixhistory, { desc = "Quickfix (history)" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    map("n", "<leader>ff", builtin.git_files, { desc = "Files (Git)" })
    map("n", "<leader>fF", builtin.find_files, { desc = "Files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    map("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
    map("n", "<leader>fr", builtin.resume, { desc = "Resume" })
    map("n", "<leader>fs", builtin.git_status, { desc = "Git Status" })
    map("n", "<leader>fw", builtin.grep_string, { desc = "Grep string" })
    map("n", "<space>fO", builtin.oldfiles, { desc = "Old Files (global)" })

    map("n", "<space>fo", function() builtin.oldfiles({ only_cwd = true }) end, { desc = "Old Files" })

    map(
      "n",
      "<space>fc",
      function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
      { desc = "Open Config" }
    )

    map(
      "n",
      "<space>fC",
      function() builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.expand("$HOME"), ".dotfiles") }) end,
      { desc = "Open Dotfiles" }
    )

    map("n", "<space>fS", utils.find_changed_files, { desc = "Git Files (changed)" })
    map("n", "<space>fA", utils.git_co_authors, { desc = "Co-Authors" })
  end,
}
