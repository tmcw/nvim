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
  {
    "vim-paper",
    name = "vim-paper",
    dev = { true }
  },
  {
    "Shatur/neovim-ayu",
  },
  {
    "atelierbram/Base2Tone-nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = vim.fn.getenv("ITERM_PROFILE") == "Light" and "ayu" or "tokyonight-moon",
      colorscheme = "paper",
    },
  },
}
