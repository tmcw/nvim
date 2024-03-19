-- change some telescope options and a keymap to browse plugin files
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
    -- change some options
    opts = function(_)
      return {
        defaults = {
          -- theme = "ivy",
          color_devicons = false,
          layout_strategy = "bottom_pane",
          sorting_strategy = "ascending",
          layout_config = {
            height = 25,
          },
          border = true,
          borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { " " },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          mappings = {
            i = {
              ["<c-t>"] = function(...)
                require("telescope.actions").select_tab(...)
              end,
            },
          },
        },
        pickers = {
          find_files = {
            previewer = false,
            disable_devicons = true,
          },
        },
      }
    end,
  },
}
