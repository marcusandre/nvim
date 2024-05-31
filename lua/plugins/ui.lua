return {
  "stevearc/dressing.nvim",
  opts = {
    select = {
      backend = { "telescope", "builtin" },
      trim_prompt = true,
      builtin = {
        mappings = { ["q"] = "Close" },
        relative = "editor",
      },
      get_config = function(opts)
        -- for simple selections, use builtin selector instead of telescope
        if opts.kind == "codeaction" or opts.kind == "rule_selection" then
          return { backend = { "builtin" }, builtin = { relative = "cursor" } }
        elseif opts.kind == "make-selector" then
          return { backend = { "builtin" } }
        end
      end,
    },
  },
}
