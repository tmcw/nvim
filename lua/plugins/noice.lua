-- Disabled in favor of snacks.nvim's notifier.
-- snacks handles vim.notify (already enabled in snacks.lua opts);
-- the cmdline, popupmenu, and :messages fall back to native Neovim.
return {
  { "folke/noice.nvim", enabled = false },
}
