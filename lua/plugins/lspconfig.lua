return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    -- diagnostics = {
    --   virtual_text = false,
    -- },
    servers = {
      tsserver = false,
      eslint = {
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = false,
            },
            showDocumentation = {
              enable = false,
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    -- NOTE(tmcw): damn it, getting "one formatter to run" is way too hard.
    -- setup autoformat
    -- LazyVim.format.register(LazyVim.lsp.formatter())

    -- setup keymaps
    LazyVim.lsp.on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    LazyVim.lsp.setup()
    LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

    LazyVim.lsp.words.setup(opts.document_highlight)

    -- diagnostics signs
    if vim.fn.has("nvim-0.10.0") == 0 then
      if type(opts.diagnostics.signs) ~= "boolean" then
        for severity, icon in pairs(opts.diagnostics.signs.text) do
          local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
          name = "DiagnosticSign" .. name
          vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end
      end
    end

    if vim.fn.has("nvim-0.10") == 1 then
      -- NOTE(tmcw): I don't want these.
      -- inlay hints

      -- code lens
      if opts.codelens.enabled and vim.lsp.codelens then
        LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
          vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = vim.lsp.codelens.refresh,
          })
        end)
      end
    end

    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
        or function(diagnostic)
          local icons = LazyVim.config.icons.diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local has_blink, blink = pcall(require, "blink.cmp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      has_blink and blink.get_lsp_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})
      if server_opts.enabled == false then
        return
      end

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    -- get all the servers that are available through mason-lspconfig
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        if server_opts.enabled ~= false then
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end
    end

    if have_mason then
      mlsp.setup({
        ensure_installed = vim.tbl_deep_extend(
          "force",
          ensure_installed,
          LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
        ),
        handlers = { setup },
      })
    end

    if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
      local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
      LazyVim.lsp.disable("vtsls", is_deno)
      LazyVim.lsp.disable("denols", function(root_dir, config)
        if not is_deno(root_dir) then
          config.settings.deno.enable = false
        end
        return false
      end)
    end
  end,
}
