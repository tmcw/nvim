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
}
