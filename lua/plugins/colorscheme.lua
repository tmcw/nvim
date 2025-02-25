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
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  {
    "vim-paper",
    name = "vim-paper",
    dir = "~/projects/vim-paper",
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
  },
  -- {
  --   "atelierbram/Base2Tone-nvim",
  --   priority = 1000,
  -- },
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.fn.getenv("ITERM_PROFILE") == "Light" and "paper" or "modus",
    },
  },
}
