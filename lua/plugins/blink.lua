return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
      sources = {
        providers = {
          buffer = { enabled = false },
          snippets = {
            score_offset = 6,
          },
          lsp = {
            score_offset = 2,
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 0,
            async = true,
          },
        },
      },
      keymap = {
        preset = "super-tab",
        -- ["<C-y>"] = { "select_and_accept" },
      },
    },
  },
}
