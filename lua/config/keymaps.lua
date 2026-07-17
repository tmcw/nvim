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

vim.keymap.set("n", "<leader>/", function()
  require("snacks").picker.grep()
end, { desc = "Grep" })

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

local biome_cmd = function()
  local binary_name = "biome"
  local local_binary = vim.fn.fnamemodify("./node_modules/.bin/" .. binary_name, ":p")
  return vim.uv.fs_stat(local_binary) and local_binary or binary_name
end

local biome_lint = function()
  local obj = vim.system({ biome_cmd(), "lint" }):wait()
  local output = obj.stderr
  if output == nil then
    return
  end
  local errors = {}
  local filename, lnum, col, code
  for _, line in ipairs(vim.fn.split(output, "\n")) do
    _, _, filename, lnum, col, code = string.find(line, "([^:]+):(%d+):(%d+)%s(.+)")
    print(filename, lnum, col, code)
    if lnum then
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

vim.keymap.set("n", "gD", function()
  vim.cmd("tab split")
  vim.lsp.buf.definition()
end, { desc = "Go to definition in new tab" })

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

-- Inspired by https://github.com/folke/snacks.nvim/discussions/1966#discussioncomment-13431851
vim.keymap.set("n", "<space>se", function()
  Snacks.picker.pick({
    format = "file",
    notify = false, -- Also prevents error when searching with additional arguments
    show_empty = true,
    live = true,
    supports_live = true,
    -- hidden = true,
    -- ignored = true,
    ---@param opts snacks.picker.grep.Config
    finder = function(opts, ctx)
      local cmd = "ast-grep"
      local args = { "run", "--color=never", "--json=stream" }
      if opts.hidden then
        table.insert(args, "--no-ignore=hidden")
      end
      if opts.ignored then
        table.insert(args, "--no-ignore=vcs")
      end
      local pattern, pargs = Snacks.picker.util.parse(ctx.filter.search)
      table.insert(args, string.format("--pattern=%s", pattern))
      vim.list_extend(args, pargs)
      return require("snacks.picker.source.proc").proc(
        vim.tbl_deep_extend("force", opts, {
          cmd = cmd,
          args = args,
          transform = function(item)
            local entry = vim.json.decode(item.text)
            if vim.tbl_isempty(entry) then
              return false
            else
              local start = entry.range.start
              item.cwd = svim.fs.normalize(opts and opts.cwd or vim.uv.cwd() or ".") or nil
              item.file = entry.file
              item.line = entry.text
              item.pos = { tonumber(start.line) + 1, tonumber(start.column) }
            end
          end,
        }),
        ctx
      )
    end,
  })
end)

vim.keymap.set("i", "<M-0>", function()
  return os.date("%Y-%m-%d")
end, { expr = true, noremap = true, silent = true, desc = "Insert date (YYYY-MM-DD)" })
