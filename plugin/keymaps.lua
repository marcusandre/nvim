local map = vim.keymap.set
local utils = require("m.utils")

-- General
map("n", "n", "nzz")
map("i", "kj", "<ESC>", { desc = "Quit input mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader><leader>", "<Cmd>:b#<CR>", { desc = "Alternate Buffer" })

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Toggle UI
map("n", "<leader>tt", utils.toggle_theme, { desc = "Toggle Theme" })
map("n", "<leader>tq", utils.toggle_qf, { desc = "Toggle Quickfix" })

-- Toggle Options
map("n", "\\i", utils.toggle_inlay_hints, { desc = "Toggle Inlay hints" })
map("n", "\\n", "<Cmd>setlocal number!<CR>", { desc = "Toggle Number" })
map("n", "\\r", "<Cmd>setlocal relativenumber!<CR>", { desc = "Toggle Relative Number" })
map("n", "\\s", "<Cmd>setlocal spell!<CR>", { desc = "Toggle Spell" })
map("n", "\\w", "<Cmd>setlocal wrap! wrap?<CR>", { desc = "Toggle Wrap" })

-- Show Tools
map("n", "<leader>sl", "<CMD>Lazy<CR>", { desc = "Lazy" })
