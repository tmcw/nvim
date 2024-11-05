-- Trying blink.cmp as an alternative to nvim.cmp. So far:
--
-- - It's a little faster.
-- - Had to turn off snippets immediately.
-- - Turned off ghost text.
-- - It's autocompleting a little too eagerly - writing a JSDoc
--   comment like /** triggers autocompletion on the last *
return {
  "saghen/blink.cmp",
  version = "*",
  opts_extend = { "sources.completion.enabled_providers" },
  dependencies = {
    -- NOTE(tmcw): removed friendly-snippets
    -- "rafamadriz/friendly-snippets",
    -- add blink.compat to dependencies
    -- { "saghen/blink.compat", opts = {} },
  },
  event = "InsertEnter",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
    windows = {
      autocomplete = {
        draw = "reversed",
        winblend = vim.o.pumblend,
      },
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        -- NOTE(tmcw) Disabled, this interrupts my flow
        enabled = false,
      },
    },

    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
    sources = {
      completion = {
        -- remember to enable your providers here
        -- NOTE(tmcw): removed snippets
        enabled_providers = { "lsp", "path", "buffer" },
      },
    },

    keymap = {
      preset = "enter",
    },
  },
}
