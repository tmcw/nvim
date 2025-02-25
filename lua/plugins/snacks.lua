return {
  "folke/snacks.nvim",
  ---@module 'snacks.nvim'
  ---@type snacks.Config
  opts = {
    -- dashboard (slows down my startup)
    dashboard = {
      enabled = false,
    },
    -- animated scroll (distracting)
    scroll = {
      enabled = false,
    },
    ---@class snacks.picker.Config
    picker = {
      icons = {
        files = {
          enabled = false,
        },
      },
      ---@class snacks.picker.formatters.Config
      formatters = {
        file = {
          -- filename_first = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<c-t>"] = {
              "edit_tab",
              mode = { "n", "i" },
            },
          },
        },
      },
    },
  },
}
