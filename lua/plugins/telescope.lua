-- change some telescope options and a keymap to browse plugin files
return {
  {
    "nvim-telescope/telescope.nvim",
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
            disable_devicons = true,
          },
        },
      }
    end,
  },
}
