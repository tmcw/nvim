return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        enable_close_on_slash = false,
      })
    end,
  },
}
