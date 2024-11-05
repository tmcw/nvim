return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require("overseer")

    overseer.setup({
      enable_progress_notifications = false,
      use_trouble_qflist = true,
      flags = {
        watch = true,
      },
      templates = { "builtin" },
      component_aliases = {
        default = {
          { "on_output_quickfix", open = false },
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
        },
      },
    })

    overseer.register_template({
      name = "biome_lint",
      builder = function()
        return {
          cmd = { "npx", "biome", "check", "--max-diagnostics=200", "--log-kind=compact" },
          components = {
            { "on_output_quickfix", open = true },
            "default",
          },
        }
      end,
    })

    overseer.register_template({
      name = "tsc",
      builder = function()
        return {
          cmd = { "npx", "tsc", "--watch" },
          env = {
            NO_COLOR = "1",
          },
          components = {
            { "on_output_quickfix", open = true },
            { "on_output_parse", problem_matcher = "$tsc-watch" },
          },
        }
      end,
    })
  end,
}
