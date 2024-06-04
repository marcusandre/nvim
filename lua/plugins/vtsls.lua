return {
  "yioneko/nvim-vtsls",
  config = function() require("vtsls").config({}) end,
  keys = {
    -- {
    --   "gD",
    --   function() require("vtsls").commands.goto_source_definition(0) end,
    --   desc = "Goto Source Definition",
    -- },
    -- {
    --   "gR",
    --   function() require("vtsls").commands.file_references(0) end,
    --   desc = "File References",
    -- },
    {
      "<leader>co",
      function() require("vtsls").commands.organize_imports(0) end,
      desc = "Organize Imports",
    },
    {
      "<leader>cm",
      function() require("vtsls").commands.add_missing_imports(0) end,
      desc = "Add missing imports",
    },
    {
      "<leader>cu",
      function() require("vtsls").commands.remove_unused_imports(0) end,
      desc = "Remove unused imports",
    },
    {
      "<leader>cd",
      function() require("vtsls").commands.fix_all(0) end,
      desc = "Fix all diagnostics",
    },
    {
      "<leader>cv",
      function() require("vtsls").commands.select_ts_version(0) end,
      desc = "Select TS workspace version",
    },
  },
}
