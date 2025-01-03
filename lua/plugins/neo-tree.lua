return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      indent = {
        with_markers = false,
      },
      name = {
        highlight = "NeoTreeFileName",
      },
    },
    filesystem = {
      filtered_items = {
        -- visible = false,
        -- hide_gitignored = false,
        -- hide_dotfiles = false,
        always_show = {
          ".env",
          ".env.example",
        },
        never_show = {
          --".DS_Store",
          --"thumbs.db"
          "node_modules",
          ".git",
          ".sst",
          ".next",
        },
      },
      follow_current_file = {
        -- enabled = true,
        leave_dirs_open = true,
      },
    },
  },
  config = function()
    vim.cmd([[
      highlight NeoTreeFileName guifg=#a6adc8
    ]])
  end,
}
