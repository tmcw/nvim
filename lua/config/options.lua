-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = false
opt.conceallevel = 0
opt.swapfile = false
opt.exrc = true
vim.g.lazyvim_prettier_needs_config = true

opt.background = vim.fn.getenv("ITERM_PROFILE") == "Light" and "light" or "dark"
