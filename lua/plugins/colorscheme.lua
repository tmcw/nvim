return {
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  {
    "felipefdl/warm-burnout",
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/nvim")
      vim.cmd.colorscheme("warm-burnout-dark")
    end,
  },
  {
    "vim-paper",
    name = "vim-paper",
    dir = "~/projects/vim-paper",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  {
    "everviolet/nvim",
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 5000,
      set_dark_mode = function()
        vim.o.background = "dark"
        -- vim.cmd("colorscheme oxocarbon")
        vim.cmd("colorscheme warm-burnout-dark")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        -- vim.cmd("colorscheme catppuccin-latte")
        vim.cmd("colorscheme warm-burnout-light")
      end,
    },
  },
}
