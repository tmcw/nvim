return {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    opts = {
      private = true, -- set new gists private by default
      clipboard = "+", -- yank URL to the system clipboard
    },
  },
  -- Optional: opens edited gists in a real buffer instead of a terminal
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function()
      vim.g.unception_block_while_host_edits = true
    end,
  },
}
