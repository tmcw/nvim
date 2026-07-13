-- coder/claudecode.nvim: IDE-style Claude Code integration
-- (diff review/approve, @-file mentions, send selection, etc.).
--
-- The base spec and <leader>a* keymaps come from the
-- lazyvim.plugins.extras.ai.claudecode extra. This file only adds the
-- `cmd` list so that :ClaudeCode* commands exist on a fresh start,
-- before any <leader>a key is pressed.
--
-- `claude` resolves to /Users/tmcw/.local/bin/claude (in PATH, not an
-- alias), so the default terminal_cmd is fine — no local-install override.
return {
  "coder/claudecode.nvim",
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
}
