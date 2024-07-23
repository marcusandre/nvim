local map = Config.map
local nmap_leader = Config.nmap_leader
local vmap_leader = Config.vmap_leader
local gitsigns = require("gitsigns")

gitsigns.setup()

-- Navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    gitsigns.nav_hunk("next")
  end
end, { desc = "Next Hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    gitsigns.nav_hunk("prev")
  end
end, { desc = "Previous Hunk" })

-- Actions
nmap_leader("hb", function() gitsigns.blame_line({ full = true }) end, "Blame Line")
nmap_leader("hD", function() gitsigns.diffthis("~") end, "Diff this")
nmap_leader("hd", gitsigns.diffthis, "Diff this")
nmap_leader("hp", gitsigns.preview_hunk, "Preview hunk")
nmap_leader("hR", gitsigns.reset_buffer, "Reset buffer")
nmap_leader("hr", gitsigns.reset_hunk, "Reset hunk")
nmap_leader("hS", gitsigns.stage_buffer, "Stage buffer")
nmap_leader("hs", gitsigns.stage_hunk, "Stage hunk")
nmap_leader("hu", gitsigns.undo_stage_hunk, "Unstage hunk")
nmap_leader("tb", gitsigns.toggle_current_line_blame, "Toggle current line blame")
nmap_leader("td", gitsigns.toggle_deleted, "Toggle deleted")
vmap_leader("hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
vmap_leader("hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
