-- change some telescope options and a keymap to browse plugin files
return {
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = function(_)
      return {
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = function(...)
                require("telescope.actions").select_tab(...)
              end,
            },
          },
        },
      }
    end,
  },
}
