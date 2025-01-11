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
      opts.theme = "hyper"
      opts.config.shortcut = {
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        -- {
        --   action = "ene | startinsert",
        --   desc = " New File",
        --   icon = " ",
        --   key = "n",
        -- },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        -- {
        --   icon = " ",
        --   icon_hl = "@variable",
        --   desc = "Files",
        --   group = "Label",
        --   action = "Telescope find_files",
        --   key = "f",
        -- },
        {
          action = "Telescope live_grep",
          desc = " Find Text",
          icon = " ",
          key = "g",
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
        -- {
        --   action = 'lua require("persistence").load()',
        --   desc = " Restore Session",
        --   icon = " ",
        --   key = "s",
        -- },
        -- {
        --   action = function()
        --     vim.api.nvim_input("<cmd>qa<cr>")
        --   end,
        --   desc = " Quit",
        --   icon = " ",
        --   key = "q",
        -- },
        {
          desc = "󰊳 Update",
          group = "@property",
          action = "Lazy update",
          key = "u",
        },
      }
      opts.config.footer = { "" }
    end,
  },
}
