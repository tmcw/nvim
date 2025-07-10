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
  require("snacks").picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<C-o>", function()
  require("snacks").picker.grep()
end, { desc = "Grep files" })

vim.keymap.set("n", "<C-g>", function()
  require("snacks").picker.git_branches()
end, { desc = "Switch git branch" })

vim.keymap.set("n", "<C-s>", function()
  require("snacks").picker.pickers()
end, { desc = "Pick a picker" })

-- vim.keymap.set("n", "-", "<cmd>Neotree toggle<CR>", { desc = "Neotree", remap = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- vim.keymap.set(
--   "n",
--   "<leader>gb",
--   '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
--   { silent = true }
-- )

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

local biome_cmd = function()
  local binary_name = "biome"
  local local_binary = vim.fn.fnamemodify("./node_modules/.bin/" .. binary_name, ":p")
  return vim.loop.fs_stat(local_binary) and local_binary or binary_name
end

local biome_lint = function()
  local obj = vim.system({ biome_cmd(), "lint" }):wait()
  local output = obj.stderr
  if output == nil then
    return
  end
  local fetch_message = false
  local errors = {}
  local filename, lnum, col, code, message
  for _, line in ipairs(vim.fn.split(output, "\n")) do
    -- if fetch_message then
    --   _, _, message = string.find(line, "%s×(.+)")

    --   if message then
    --     message = (message):gsub("^%s+×%s*", "")

    --     print("Inserting into table")

    --     table.insert({
    --       source = "biomejs",
    --       filename = filename,
    --       type = "E",
    --       lnum = tonumber(lnum) - 1,
    --       col = tonumber(col),
    --       message = message,
    --       code = code,
    --     })

    --     fetch_message = false
    --   end
    -- else
    --
    _, _, filename, lnum, col, code = string.find(line, "([^:]+):(%d+):(%d+)%s(.+)")
    print(filename, lnum, col, code)
    if lnum then
      -- fetch_message = true
      print(filename)
      table.insert(errors, {
        source = "biomejs",
        filename = filename,
        type = "E",
        lnum = tonumber(lnum),
        col = tonumber(col),
        text = code,
      })
    end
    -- end
  end

  -- https://neovim.io/doc/user/builtin.html#setqflist()
  vim.fn.setqflist(errors)
  vim.cmd("copen")
end

vim.keymap.set("n", "<leader>cb", function()
  biome_lint()
end, { desc = "Biome fixes" })

local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, "No location found")
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function peek_definition()
  local win = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(win, vim.lsp.client.offset_encoding)
  return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

vim.keymap.set({ "n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({
    open = function(url)
      vim.fn.setreg("+", url)
    end,
    -- This is the change from the default. I want a permalink.
    what = "permalink",
    notify = false,
  })
end, { desc = "Git Browse (copy)" })
