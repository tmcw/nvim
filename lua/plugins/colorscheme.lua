return {
  -- {
  --   "catppuccin/nvim",
  -- },
  -- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  -- {
  --   "folke/tokyonight.nvim",
  -- },
  -- {
  --   "jacoborus/tender.vim",
  -- },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  -- },
  -- {
  --   "zortax/three-firewatch",
  -- },
  -- {
  --   "rakr/vim-two-firewatch",
  -- },
  --
  -- {
  --   "savq/melange-nvim",
  -- },
  -- {
  --   "ray-x/aurora",
  -- },
  -- {
  --   "kepano/flexoki-neovim",
  --   name = "flexoki",
  -- },
  -- {
  --   "NLKNguyen/papercolor-theme",
  -- },
  -- {
  --   "atelierbram/Base2Tone-nvim",
  --   priority = 1000,
  -- },
  --{
  --   "Shatur/neovim-ayu",
  -- },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  {
    "vim-paper",
    name = "vim-paper",
    dir = "~/projects/vim-paper",
  },
  -- {
  --   "ribru17/bamboo.nvim",
  --   priority = 1000,
  -- },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup()
    end,
  },
  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --   -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --   dependencies = "rktjmp/lush.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   -- you can set set configuration options here
  --   -- config = function()
  --   --   vim.g.zenbones_darken_comments = 45
  --   --   vim.cmd.colorscheme("zenbones")
  --   -- end,
  -- },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 5000,
      set_dark_mode = function()
        vim.cmd("colorscheme carbonfox")
        vim.api.nvim_set_option_value("background", "dark", {})
      end,
      set_light_mode = function()
        vim.cmd("colorscheme dayfox")
        vim.api.nvim_set_option_value("background", "light", {})
      end,
    },
  },
}
