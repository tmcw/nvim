-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- Disable inlays by default
vim.lsp.inlay_hint.enable(false)

-- A way to open diffview that shows the same kind of diff
-- that GitHub would show.
vim.api.nvim_create_user_command("PRDiff", function()
  require("diffview").open({ "origin/main...", "--imply-local" })
end, {
  desc = "Diff this branch against main like a PR",
})
