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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<C-t>", "<C-w><Enter><C-w>T", { buffer = true, silent = true })
  end,
})

-- Replaces the gist.nvim plugin with a thin `gh` CLI wrapper.
-- Creates a private gist from the current file and copies the URL to the + register.
vim.api.nvim_create_user_command("GistCreate", function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.fn.filereadable(file) == 0 then
    vim.notify("Save the file first — gh gists from disk", vim.log.levels.WARN)
    return
  end
  vim.system({ "gh", "gist", "create", file, "--private" }, { text = true }, function(obj)
    local url = vim.trim(obj.stdout or "")
    if obj.code ~= 0 or url == "" then
      vim.schedule(function()
        vim.notify("gh gist create failed: " .. (obj.stderr or "unknown error"), vim.log.levels.ERROR)
      end)
      return
    end
    vim.fn.setreg("+", url)
    vim.schedule(function()
      vim.notify("Private gist created (URL copied to +): " .. url)
    end)
  end)
end, { desc = "Create private gist from current file, copy URL" })

vim.api.nvim_create_user_command("GistsList", function()
  vim.cmd("belowright split | terminal gh gist list")
end, { desc = "List your gists in a terminal" })
