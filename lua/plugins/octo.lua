return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  options = {},
  config = function()
    require("octo").setup()
  end,
}
