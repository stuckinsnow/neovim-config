return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    preset = "helix", -- Options include "helix", "classic", "modern"
    spec = {
      {
        mode = { "n", "v" },
        -- { "<leader>r", group = "replace" },
        { "<leader>fn", group = "new file/folder" },
      },
    },
  },
}
