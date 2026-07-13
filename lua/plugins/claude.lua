return {
  "greggh/claude-code.nvim",
  cmd = "ClaudeCode",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup()
  end,
}
