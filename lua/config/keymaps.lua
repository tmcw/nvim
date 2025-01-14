-- local wk = require("which-key")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-j>")

vim.keymap.set("n", "<C-k>", "<cmd>tabnext<cr>", { desc = "Next Tab quick", remap = true })
vim.keymap.set("n", "<C-j>", "<cmd>tabprev<cr>", { desc = "Previous Tab quick", remap = true })

vim.keymap.set("n", "<C-p>", function()
  require("fzf-lua").files()
end, { desc = "Find files" })

vim.keymap.set("n", "<C-o>", function()
  require("fzf-lua").live_grep()
end, { desc = "Grep files" })

-- vim.keymap.set("n", "-", "<cmd>Neotree toggle<CR>", { desc = "Neotree", remap = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set(
  "n",
  "<leader>gb",
  '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)

vim.keymap.set("n", "<leader>ghm", function()
  local gs = package.loaded.gitsigns
  gs.diffthis("main")
end, { desc = "Diff this against main" })

vim.keymap.set("n", "<leader>ua", function()
  if vim.o.background == "dark" then
    print("Switching to light mode")
    vim.cmd("set background=light")
    vim.cmd("colorscheme PaperColor")
  else
    print("Switching to dark mode")
    vim.cmd("set background=dark")
    vim.cmd("colorscheme oxocarbon")
  end
end, { desc = "Toggle light dark mode" })

-- wk.register({
--   cv = {
--     name = "VtsExec actions",
--     s = { "<CMD>VtsExec sort_imports<CR>", "Sort imports" },
--     r = { "<CMD>VtsExec remove_unused<CR>", "Remove unused" },
--     a = { "<CMD>VtsExec add_missing_exports<CR>", "Add missing exports" },
--     v = { "<CMD>VtsExec source_actions<CR>", "Source actions" },
--   },
-- }, { prefix = "<leader>" })
