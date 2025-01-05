return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      indent = {
        with_markers = false,
        -- expander_collapsed = "",
        -- expander_expanded = "",
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        -- folder_closed = "", -- default
        -- folder_open = "", -- default
        -- folder_closed = "",
        -- folder_open = "",
        folder_closed = "→",
        folder_open = "↓",
        folder_empty = "󰜌",
      },
      expanders = {
        arrow_closed = "", -- Set to empty string to hide closed arrow
        arrow_open = "", -- Set to empty string to hide open arrow
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
        leave_dirs_open = false,
      },
    },
  },
}
