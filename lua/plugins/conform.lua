local notify = require("notify")

local function show_notification(message, level)
  notify(message, level, { title = "conform.nvim" })
end

vim.api.nvim_create_user_command("FormatToggle", function(args)
  local is_global = not args.bang
  if is_global then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat then
      show_notification("Autoformat-on-save disabled globally", "info")
    else
      show_notification("Autoformat-on-save enabled globally", "info")
    end
  else
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat then
      show_notification("Autoformat-on-save disabled for this buffer", "info")
    else
      show_notification("Autoformat-on-save enabled for this buffer", "info")
    end
  end
end, {
  desc = "Toggle autoformat-on-save",
  bang = true,
})

return {
  "stevearc/conform.nvim",
  enabled = false,
  dependencies = { "mason.nvim" },
  opts = {
    formatters_by_ft = {
      json = { "biome" },
      javascript = { "biome", stop_after_first = true },
      typescript = { "biome", stop_after_first = true },
    },
  },
}
