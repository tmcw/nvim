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
    picker = {
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
