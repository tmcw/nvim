local function patch_snacks_dim()
  local ok, Win = pcall(require, "snacks.win")
  if not ok then
    return
  end
  local orig_dim = Win.dim
  function Win:dim(parent)
    local r = orig_dim(self, parent)
    r.height = math.floor(r.height)
    r.width = math.floor(r.width)
    r.row = math.floor(r.row)
    r.col = math.floor(r.col)
    return r
  end
end

return {
  "folke/snacks.nvim",
  config = function(_, opts)
    require("snacks").setup(opts)
    patch_snacks_dim()
  end,

  ---@module 'snacks.'
  ---@class snacks.Config
  opts = {
    -- dashboard (slows down my startup)
    dashboard = {
      enabled = false,
    },
    -- animated scroll (distracting)
    scroll = {
      enabled = false,
    },
    -- notifications (replaces noice.nvim)
    notifier = {
      enabled = true,
    },
    ---@class snacks.indent.Config
    -- indent = {
    --   indent = {
    --     enabled = false,
    --   },
    -- },
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
          truncate = 80,
          -- filename_first = true,
        },
      },
      layout = {
        layout = {
          box = "vertical",
          row = -1,
          backdrop = false,
          width = 0,
          min_width = 80,
          height = 0.8,
          min_height = 30,
          title = "{title} {live} {flags}",
          title_pos = "center",
          { win = "input", height = 1, border = "top" },
          { win = "list", border = "none" },
          -- TODO: would be nice to have the full file name here.
          { win = "preview", title = "{preview}", height = 0.4, border = "top" },
        },
      },

      -- TODO: this doesn't work still.
      win = {
        input = {
          keys = {
            ["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
          },
        },
        list = {
          keys = {
            ["<C-t>"] = "edit_tab",
          },
        },
      },
    },
  },
}
