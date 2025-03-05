return {
  "ibhagwan/fzf-lua",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("fzf-lua").setup({
      "default",
      winopts = {
        border = true,
        -- fullscreen = true,
        preview = {
          border = true,
          default = "bat",
        },
      },
    })
  end,
}
