local map = Config.map

-- General
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("i", "kj", "<ESC>", { desc = "Quit input mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better command history navigation
map("c", "<C-p>", "<Up>", { silent = false })
map("c", "<C-n>", "<Down>", { silent = false })

-- Clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Toggle: Options
map("n", "\\r", "<Cmd>setlocal relativenumber!<CR>", { desc = "Toggle Relative Number" })
map("n", "\\s", "<Cmd>setlocal spell!<CR>", { desc = "Toggle Spell" })
map("n", "\\w", "<Cmd>setlocal wrap! wrap?<CR>", { desc = "Toggle Wrap" })
