return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    preset = "modern", -- Options include "helix", "classic", "modern"
    spec = {
      {
        mode = { "n", "v" },
        -- { "<leader>r", group = "replace" },
        { "<leader>ac", group = "custom - copilot" },
        { "<leader>fn", group = "new file/folder" },
        { "<leader>fo", group = "custom options" },
      },
    },
  },
}
