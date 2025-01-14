-- Using conform.nvim and trying to get LSP formatters _not_ to
-- run because they always clobber my extmarks
return {
  "stevearc/conform.nvim",
  enabled = true,
  dependencies = { "mason.nvim" },
  opts = {
    formatters_by_ft = {
      json = { "biome" },
      javascript = { "prettier", "biome", stop_after_first = true },
      typescriptreact = { "prettier", "biome", stop_after_first = true },
      typescript = { "prettier", "biome", stop_after_first = true },
    },
  },
}
