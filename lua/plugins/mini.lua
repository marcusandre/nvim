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

    if vim.env.OBSIDIAN_VAULT_DIR then
      MiniPick.registry.notes = function()
        return MiniPick.builtin.files(nil, { source = { cwd = vim.env.OBSIDIAN_VAULT_DIR } })
      end
    end

    map("n", "<leader>/", "<Cmd>Pick buf_lines scope='current'<CR>", { desc = "Search buffer" })
    map("n", "<leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Buffers" })
    map("n", "<leader>fc", "<Cmd>Pick config<CR>", { desc = "Config" })
    map("n", "<leader>ff", "<Cmd>Pick git_files<CR>", { desc = "Git files" })
    map("n", "<leader>fF", "<Cmd>Pick files<CR>", { desc = "Files" })
    map("n", "<leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Grep live" })
    map("n", "<leader>fh", "<Cmd>Pick help<CR>", { desc = "Help" })
    map("n", "<leader>fn", "<Cmd>Pick notes<CR>", { desc = "Notes" })
    map("n", "<leader>fr", "<Cmd>Pick resume<CR>", { desc = "Resume" })
    map("n", "<leader>fs", "<Cmd>Pick git_hunks<CR>", { desc = "Git hunks" })
    map("n", "<leader>fS", pick_modified_untracked, { desc = "Git hunks" })
    map("n", "<leader>fz", "<Cmd>Pick spellsuggest<CR>", { desc = "Spelling" })

    -- mini.visits
    require("mini.visits").setup()

    local make_select_path = function(select_global, recency_weight)
      local visits = require("mini.visits")
      local sort = visits.gen_sort.default({ recency_weight = recency_weight })
      local select_opts = { sort = sort }
      return function()
        local cwd = select_global and "" or vim.fn.getcwd()
        visits.select_path(cwd, select_opts)
      end
    end

    local map_vis_select = function(lhs, desc, ...) map("n", lhs, make_select_path(...), { desc = desc }) end

    map_vis_select("<Leader>fo", "Select recent (cwd)", false, 1)
    map_vis_select("<Leader>fO", "Select recent (all)", true, 1)
    map_vis_select("<Leader>vy", "Select frecent (cwd)", false, 0.5)
    map_vis_select("<Leader>vY", "Select frecent (all)", true, 0.5)
    map_vis_select("<Leader>vf", "Select frequent (cwd)", false, 0)
    map_vis_select("<Leader>vF", "Select frequent (all)", true, 0)

    local map_vis_label = function(keys, call, desc)
      local rhs = "<Cmd>lua MiniVisits." .. call .. "<CR>"
      map("n", "<Leader>" .. keys, rhs, { desc = desc })
    end

    map_vis_label("vv", 'add_label("core")', "Add to core")
    map_vis_label("vV", 'remove_label("core")', "Remove from core")
    map_vis_label("vc", 'select_path(nil, { filter = "core" })', "Select core (cwd)")
    map_vis_label("vC", 'select_path("", { filter = "core" })', "Select core (all)")
  end,
}
