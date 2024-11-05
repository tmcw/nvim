return {
  "dmmulroy/tsc.nvim",
  config = function()
    require("tsc").setup({
      enable_progress_notifications = false,
      use_trouble_qflist = true,
      flags = {
        watch = true,
      },
    })
  end,
}
