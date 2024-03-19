return {
  "neovim/nvim-lspconfig",
  opts = {
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
