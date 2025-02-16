return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

██████╗ ███████╗██╗   ██╗██████╗  █████╗ ██████╗    ███╗   ██╗███████╗████████╗
██╔══██╗██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
██║  ██║█████╗  ██║   ██║██████╔╝███████║██║  ██║   ██╔██╗ ██║█████╗     ██║   
██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═══╝ ██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║   
██████╔╝███████╗ ╚████╔╝ ██║     ██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║   
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   
                                                                               
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      -- themes available are hyper and doom
      opts.theme = "hyper"
      opts.config.shortcut = {
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "R",
        },
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        -- {
        --   action = "Telescope live_grep",
        --   desc = " Find Text",
        --   icon = " ",
        --   key = "g",
        -- },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "r",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          desc = "󰊳 Update",
          group = "@property",
          action = "Lazy update",
          key = "u",
        },
        {
          desc = "󰊳 Mason",
          group = "@property",
          action = "Mason",
          key = "m",
        },
      }
      opts.config.footer = { "" }
    end,
  },
}
