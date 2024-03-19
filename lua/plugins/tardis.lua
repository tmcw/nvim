return {
  "fredeeb/tardis.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("tardis-nvim").setup({
      keymap = {
        ["next"] = "<C-j>", -- next entry in log (older)
        ["prev"] = "<C-k>", -- previous entry in log (newer)
        ["quit"] = "q", -- quit all
        ["revision_message"] = "<C-m>", -- show revision message for current revision
      },
      initial_revisions = 10, -- initial revisions to create buffers for
      max_revisions = 256, -- max number of revisions to load
    })
  end,
}
