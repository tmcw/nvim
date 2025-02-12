-- Using conform.nvim and trying to get LSP formatters _not_ to
-- run because they always clobber my extmarks
return {
  "stevearc/conform.nvim",
  enabled = true,
  dependencies = { "mason.nvim" },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      json = { "biome" },
      javascript = { "biome", stop_after_first = true },
      typescriptreact = { "biome", stop_after_first = true },
      typescript = { "biome", stop_after_first = true },
    },
  },
}
