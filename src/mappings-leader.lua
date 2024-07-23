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
nmap_leader("<space>", "<Cmd>FzfLua builtin<CR>", "FzfLua")
nmap_leader("f/", "<Cmd>FzfLua search_history<CR>", '"/" history')
nmap_leader("f:", "<Cmd>FzfLua command_history<CR>", '":" history')
nmap_leader("fC", "<Cmd>FzfLua git_commits<CR>", "Commits (all)")
nmap_leader("fD", "<Cmd>FzfLua diagnostics_document<CR>", "Diagnostics (current)")
nmap_leader("fG", "<Cmd>FzfLua grep_cword<CR>", "Grep (word)")
nmap_leader("fL", "<Cmd>FzfLua lines<CR>", "Lines (all)")
nmap_leader("fR", "<Cmd>FzfLua resume<CR>", "Resume")
nmap_leader("fa", "<Cmd>FzfLua git_status<CR>", "Git Status")
nmap_leader("fb", "<Cmd>FzfLua buffers<CR>", "Buffers")
nmap_leader("fc", "<Cmd>FzfLua git_bcommits<CR>", "Commits (current)")
nmap_leader("fd", "<Cmd>FzfLua diagnostics_workspace<CR>", "Diagnostics (all)")
nmap_leader("ff", "<Cmd>FzfLua files<CR>", "Files")
nmap_leader("fg", "<Cmd>FzfLua grep_visual<CR>", "Grep (visual)")
nmap_leader("fh", "<Cmd>FzfLua helptags<CR>", "Help tags")
nmap_leader("fl", "<Cmd>FzfLua blines<CR>", "Lines (current)")
nmap_leader("fo", "<Cmd>FzfLua oldfiles<CR>", "Oldfiles")
nmap_leader("fr", "<Cmd>FzfLua lsp_references<CR>", "References")

-- g is for git
nmap_leader("gb", "<Cmd>Git blame<CR>", "Blame")
nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
nmap_leader("gg", "<Cmd>Git<CR>", "Git")
nmap_leader("gL", "<Cmd>Git log --oneline --follow -- %<CR>", "Log Buffer")
nmap_leader("gl", "<Cmd>Git log --oneline<CR>", "Log")
nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")

map({ "n", "v" }, "<leader>gy", "<Cmd>GitLink<CR>", { desc = "Yank git link" })
map({ "n", "v" }, "<leader>gY", "<Cmd>GitLink!<CR>", { desc = "Open git link" })

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
nmap_leader("tF", "<Cmd>TestFile --coverage<CR>", "File (quickfix)")
nmap_leader("tf", "<Cmd>TestFile<CR>", "File")
nmap_leader("tL", "<Cmd>TestLast --coverage<CR>", "Last (quickfix)")
nmap_leader("tl", "<Cmd>TestLast<CR>", "Last")
nmap_leader("tN", "<Cmd>TestNearest --coverage<CR>", "Nearest (quickfix)")
nmap_leader("tn", "<Cmd>TestNearest<CR>", "Nearest")
