-- I miss :GBrowse from vim-fugitive: this
-- brings it back with a <leader>gy shortcut
-- to copy a GitHub permalink
return {
  {
    "ruifm/gitlinker.nvim",
    lazy = true,
    init = function()
      require("gitlinker").setup()
    end,
  },
}
