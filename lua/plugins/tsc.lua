return {
  "dmmulroy/tsc.nvim",
  cmd = "TSC",
  config = function()
    require("tsc").setup({
      enable_progress_notifications = false,
      use_trouble_qflist = true,
      flags = {
        watch = false,
      },
    })
  end,
}
