-- TypeScript LSP: prefer tsgo (TypeScript 7 native) in repos that opt in by
-- installing a local `tsgo` binary; fall back to vtsls everywhere else. The two
-- servers are made mutually exclusive via root_dir so only one ever attaches.

-- A repo opts into tsgo by having node_modules/.bin/tsgo anywhere up the tree.
local function has_local_tsgo(bufnr)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  if fname == "" then
    return false
  end
  for dir in vim.fs.parents(fname) do
    if vim.uv.fs_stat(vim.fs.joinpath(dir, "node_modules", ".bin", "tsgo")) then
      return true
    end
  end
  return false
end

-- Project-root detection copied from nvim-lspconfig's tsgo/vtsls configs: pick
-- the package-manager root, but bail out on Deno projects.
local function project_root(bufnr, on_dir)
  local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
  root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
    or vim.list_extend(root_markers, { ".git" })
  local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
  local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
  local root = vim.fs.root(bufnr, root_markers)
  if deno_lock_root and (not root or #deno_lock_root > #root) then
    return
  end
  if deno_root and (not root or #deno_root >= #root) then
    return
  end
  on_dir(root or vim.fn.getcwd())
end

-- Gate a server on whether the repo opted into tsgo.
local function root_dir_if(want_tsgo)
  return function(bufnr, on_dir)
    if has_local_tsgo(bufnr) ~= want_tsgo then
      return
    end
    project_root(bufnr, on_dir)
  end
end

local no_inlay_hints = {
  typescript = {
    inlayHints = {
      enumMemberValues = { enabled = false },
      functionLikeReturnTypes = { enabled = false },
      parameterNames = { enabled = false },
      parameterTypes = { enabled = false },
      propertyDeclarationTypes = { enabled = false },
      variableTypes = { enabled = false },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      -- vtsls is installed via mason, so LazyVim's normal server pipeline
      -- handles enabling it. Only gate it to repos that didn't opt into tsgo.
      opts.servers.vtsls = {
        root_dir = root_dir_if(false),
        settings = no_inlay_hints,
      }
      -- tsgo (TypeScript 7 native) comes from the repo-local node_modules or the
      -- global (mise) install, never from mason. LazyVim's server loop only
      -- auto-enables mason-installed servers, so configure and enable it directly
      -- with the native LSP API (layering over nvim-lspconfig's lsp/tsgo.lua).
      vim.lsp.config("tsgo", {
        root_dir = root_dir_if(true),
        settings = no_inlay_hints,
      })
      vim.lsp.enable("tsgo")
    end,
  },
}
