return {
  "f-person/auto-dark-mode.nvim",

  opts = {
    update_interval = 5000,
    set_dark_mode = function()
      vim.cmd("colorscheme oxocarbon")
      vim.api.nvim_set_option_value("background", "dark", {})
    end,
    set_light_mode = function()
      vim.cmd("colorscheme paper")
      vim.api.nvim_set_option_value("background", "light", {})
    end,
  },
}
