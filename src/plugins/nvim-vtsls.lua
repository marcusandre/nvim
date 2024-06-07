local nmap_leader = Config.nmap_leader

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "tsx" },
  callback = function()
    nmap_leader("co", function() require("vtsls").commands.organize_imports(0) end, "Organize imports")
    nmap_leader("cm", function() require("vtsls").commands.add_missing_imports(0) end, "Add missing symbols")
    nmap_leader("cu", function() require("vtsls").commands.remove_unused_imports(0) end, "Remove unused imports")
    nmap_leader("cd", function() require("vtsls").commands.fix_all(0) end, "Fix all diagnostics")
    nmap_leader("cv", function() require("vtsls").commands.select_ts_version(0) end, "Select TS workspace version")
  end,
})
