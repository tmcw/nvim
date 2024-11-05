return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.indent.enable = false
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end
  end,
}
