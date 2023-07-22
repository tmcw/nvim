return {
  {
    "ruifm/gitlinker.nvim",
    lazy = true,
    init = function()
      require("gitlinker").setup()
    end,
  },
}
