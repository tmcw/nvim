return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    keys = {
      {
        "<leader>uv",
        function()
          require("no-neck-pain").toggle()
        end,
        desc = "Center",
      },
    },
  },
}
