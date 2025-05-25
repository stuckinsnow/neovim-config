-- NOTE: old snacks config; keeping this in case I decide to revert changes

return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      enabled = false,
    },
    explorer = {
      enabled = false,
    },
    dashboard = {
      preset = {
        header = [[
██████╗ ███████╗██╗   ██╗██████╗  █████╗ ██████╗    ███╗   ██╗███████╗████████╗
██╔══██╗██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
██║  ██║█████╗  ██║   ██║██████╔╝███████║██║  ██║   ██╔██╗ ██║█████╗     ██║   
██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═══╝ ██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║   
██████╔╝███████╗ ╚████╔╝ ██║     ██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║   
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   
        ]],

        keys = {
          -- { icon = " ", key = "f", desc = "Find File", action = ":lua LazyVim.pick()()" },
          -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "R", desc = "Recent Files", action = ":lua LazyVim.pick('oldfiles')()" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua LazyVim.pick.config_files()()" },
          { icon = " ", key = "r", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰊳 ", key = "u", desc = "Update", action = ":Lazy update", group = "@property" },
          { icon = "󰊳 ", key = "m", desc = "Mason", action = ":Mason", group = "@property" },
          -- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { pane = 1, section = "header", padding = 2 },
        {
          title = "",
          pane = 2,
          cmd = "",
          height = 5,
          padding = 8,
        },
        { section = "keys", gap = 1, padding = 2 },
        {
          pane = 2,
          icon = "",
          title = "Projects",
          section = "projects",
          indent = 3,
          padding = 2,
        },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        -- {
        --   pane = 2,
        --   icon = " ",
        --   desc = "Browse Repo",
        --   padding = 1,
        --   key = "b",
        --   action = function()
        --     Snacks.gitbrowse()
        --   end,
        -- },

        -- function()
        --   local in_git = Snacks.git.get_root() ~= nil
        --   local cmds = {
        --     {
        --       icon = " ",
        --       title = "Git Status",
        --       cmd = "git --no-pager diff --stat -B -M -C",
        --       height = 8,
        --     },
        --   }
        --   return vim.tbl_map(function(cmd)
        --     return vim.tbl_extend("force", {
        --       pane = 1,
        --       section = "terminal",
        --       enabled = in_git,
        --       padding = 1,
        --       ttl = 5 * 60,
        --       indent = 3,
        --     }, cmd)
        --   end, cmds)
        -- end,

        { pane = 1, section = "startup" },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            -- {
            --   icon = " ",
            --   title = "Git Status",
            --   cmd = "git --no-pager diff --stat -B -M -C",
            --   height = 8,
            -- },
            --
            -- {
            --   title = "Git Info",
            --   cmd = "git log -n 3 --pretty=format:'%h - %s - %an (%cr)'",
            --   icon = "",
            --   height = 5,
            --   padding = 2,
            -- },
            -- -- gh ext install meiji163/gh-notify
            -- {
            --   title = "Notifications",
            --   cmd = "gh notify -s -n2",
            --   icon = " ",
            --   section = "terminal",
            --   action = function()
            --     vim.ui.open("https://github.com/notifications")
            --   end,
            --   key = "N",
            --   height = 3,
            -- },
            -- {
            --   title = "Open Issues",
            --   cmd = "gh issue list -L 3",
            --   key = "i",
            --   action = function()
            --     vim.fn.jobstart("gh issue list --web", { detach = true })
            --   end,
            --   icon = " ",
            --   height = 7,
            -- },
            -- {
            --   icon = " ",
            --   title = "Open PRs",
            --   cmd = "gh pr list -L 3",
            --   key = "P",
            --   action = function()
            --     vim.fn.jobstart("gh pr list --web", { detach = true })
            --   end,
            --   height = 8,
            -- },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
      },
    },
    indent = {
      animate = {
        style = "down", -- "out", "up_down", "down", "up"
      },
      enabled = true,
      indent = {
        enabled = false,
        only_scope = true,
        hl = {
          "SnacksIndentCustom2",
          "SnacksIndentCustom3",
        },
      },
      scope = {
        enabled = true,
        hl = "SnacksIndentCustom",
      },
    },
    scroll = {
      enabled = false, -- Disables smooth scrolling
    },
  },
}
