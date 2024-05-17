return {
  "ruifm/gitlinker.nvim",
  config = function()
    require("gitlinker").setup({
      opts = {
        add_current_line_on_normal_mode = false,
      },
      callbacks = {
        ["github.deere.com"] = require("gitlinker.hosts").get_github_type_url,
      },
    })
  end,
}
