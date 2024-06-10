local map = Config.map
local nmap_leader = Config.nmap_leader
local xmap_leader = Config.xmap_leader

-- b is for 'buffer'
nmap_leader("ba", "<Cmd>b#<CR>", "Alternate")
nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Delete")
nmap_leader("bo", "<Cmd>%bd|e#|bd#<CR>", "Delete Other Buffers")

-- e is for 'explore' and 'edit'
nmap_leader("ef", "<Cmd>Oil<CR>", "File directory")
nmap_leader("eq", "<Cmd>lua Config.toggle_quickfix()<CR>", "Quickfix")

-- f is for 'fuzzy find'
nmap_leader("f/", '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader("f:", '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader("fa", '<Cmd>Pick git_hunks scope="staged"<CR>', "Added hunks (all)")
nmap_leader("fA", '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', "Added hunks (current)")
nmap_leader("fb", "<Cmd>Pick buffers<CR>", "Buffers")
nmap_leader("fC", "<Cmd>Pick git_commits<CR>", "Commits (all)")
nmap_leader("fc", '<Cmd>Pick git_commits path="%"<CR>', "Commits (current)")
nmap_leader("fD", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
nmap_leader("fd", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
nmap_leader("ff", "<Cmd>Pick files<CR>", "Files")
nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "Grep live")
nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
nmap_leader("fh", "<Cmd>Pick help<CR>", "Help tags")
nmap_leader("fH", "<Cmd>Pick hl_groups<CR>", "Highlight groups")
nmap_leader("fL", '<Cmd>Pick buf_lines scope="all"<CR>', "Lines (all)")
nmap_leader("fl", '<Cmd>Pick buf_lines scope="current"<CR>', "Lines (current)")
nmap_leader("fM", "<Cmd>Pick git_hunks<CR>", "Modified hunks (all)")
nmap_leader("fm", '<Cmd>Pick git_hunks path="%"<CR>', "Modified hunks (current)")
nmap_leader("fn", "<Cmd>Pick notes<CR>", "Notes")
nmap_leader("fR", "<Cmd>Pick resume<CR>", "Resume")
nmap_leader("fr", '<Cmd>Pick lsp scope="references"<CR>', "References (LSP)")
nmap_leader("fS", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', "Symbols workspace (LSP)")
nmap_leader("fs", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols buffer (LSP)")
nmap_leader("fv", '<Cmd>Pick visit_paths cwd=""<CR>', "Visit paths (all)")
nmap_leader("fV", "<Cmd>Pick visit_paths<CR>", "Visit paths (cwd)")

-- g is for git
nmap_leader("gb", "<Cmd>Git blame<CR>", "Blame")
nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
nmap_leader("gg", "<Cmd>Git<CR>", "Git")
nmap_leader("gG", "<Cmd>LazyGit<CR>", "Lazygit")
nmap_leader("gL", "<Cmd>Git log --oneline --follow -- %<CR>", "Log Buffer")
nmap_leader("gl", "<Cmd>Git log --oneline<CR>", "Log")
nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")

map({ "n", "v" }, "gy", "<Cmd>GitLink<CR>", { desc = "Yank git link" })
map({ "n", "v" }, "gY", "<Cmd>GitLink!<CR>", { desc = "Open git link" })

map("n", "g<space>", ":Git<Space>", { desc = "Git Command" })
map("n", "gX", "<Cmd>Gread<CR>", { desc = "Git Reset Buffer" })

-- l is for 'LSP' (Language Server Protocol)
nmap_leader("la", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Arguments popup")
nmap_leader("ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics popup")
nmap_leader("lf", "<Cmd>Format<CR>", "Format")
nmap_leader("li", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Information")
nmap_leader("lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic")
nmap_leader("lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic")
nmap_leader("lR", "<Cmd>lua vim.lsp.buf.references()<CR>", "References")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
nmap_leader("ls", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Source definition")

xmap_leader("lf", "<Cmd>Format<CR>", "Format selection")

-- o is for 'other' and 'obsidian'
nmap_leader("od", "<Cmd>Neogen<CR>", "Document")
nmap_leader("og", "<Cmd>ObsidianSearch<CR>", "Grep notes")
nmap_leader("on", "<Cmd>ObsidianNew<CR>", "New note")
nmap_leader("ot", "<Cmd>ObsidianToday<CR>", "Today")
nmap_leader("oT", "<Cmd>ObsidianYesterday<CR>", "Yesterday")

-- t is for 'test'
nmap_leader("tF", "<Cmd>TestFile -strategy=make | copen<CR>", "File (quickfix)")
nmap_leader("tf", "<Cmd>TestFile<CR>", "File")
nmap_leader("tL", "<Cmd>TestLast -strategy=make | copen<CR>", "Last (quickfix)")
nmap_leader("tl", "<Cmd>TestLast<CR>", "Last")
nmap_leader("tN", "<Cmd>TestNearest -strategy=make | copen<CR>", "Nearest (quickfix)")
nmap_leader("tn", "<Cmd>TestNearest<CR>", "Nearest")
nmap_leader("tS", "<Cmd>TestSuite -strategy=make | copen<CR>", "Suite (quickfix)")
nmap_leader("ts", "<Cmd>TestSuite<CR>", "Suite")

-- v is for 'visits'
nmap_leader("vv", '<Cmd>lua MiniVisits.add_label("core")<CR>', 'Add "core" label')
nmap_leader("vV", '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')
nmap_leader("vl", "<Cmd>lua MiniVisits.add_label()<CR>", "Add label")
nmap_leader("vL", "<Cmd>lua MiniVisits.remove_label()<CR>", "Remove label")

local map_pick_core = function(keys, cwd, desc)
  local MiniExtra = require("mini.extra")
  local MiniVisits = require("mini.visits")
  local rhs = function()
    local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
    MiniExtra.pickers.visit_paths({ cwd = cwd, filter = "core", sort = sort_latest }, { source = { name = desc } })
  end
  nmap_leader(keys, rhs, desc)
end
map_pick_core("vc", "", "Core visits (all)")
map_pick_core("vC", nil, "Core visits (cwd)")
