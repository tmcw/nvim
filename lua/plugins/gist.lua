return {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    opts = {
      private = true, -- set new gists private by default
      clipboard = "+", -- yank URL to the system clipboard
    },
  },
}
