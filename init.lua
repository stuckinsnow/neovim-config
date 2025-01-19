--- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- require("tokyonight").setup({
--   style = "storm",
--   on_highlights = function(hl, c)
--     hl.LineNrAbove = {
--       fg = c.green,
--     }
--     hl.LineNrBelow = {
--       fg = c.red,
--     }
--   end,
-- })

-- Configure Catppuccin theme
require("catppuccin").setup({
  flavour = "mocha", -- Choose between "latte", "frappe", "macchiato", "mocha"
  custom_highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.mauve },
      -- LineNr = { fg = "#bac2de" },
      -- LineNr = { fg = "#535363" },
      -- LineNr = { fg = colors.overlay0 },
      LineNrAbove = { fg = colors.overlay2 },
      LineNrBelow = { fg = colors.overlay2 },
    }
  end,
})

-- Load the Catppuccin theme
-- vim.g.catppuccin_flavour = "mocha"
vim.cmd.colorscheme("catppuccin")
-- Load the tokyonight theme
-- vim.cmd.colorscheme("tokyonight")

-- Gitsigns setup directly in the main config
require("gitsigns").setup({
  current_line_blame = true, -- Enable blame on the current line by default
})

vim.opt.fileformats = { "unix" }

-- Set tab size to 4 spaces
vim.opt.tabstop = 4 -- Number of spaces a tab represents
vim.opt.shiftwidth = 4 -- Number of spaces to use for indentation
vim.opt.softtabstop = 4 -- How many spaces to insert when hitting <Tab>
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smarttab = true -- Use smart tabbing

vim.o.undolevels = 4000

-- require("config.ui-2")
require("config.ui")
require("config.bufferline")

-- Set the highlight for NeoTreeFileName
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#bac2de", bg = "", bold = false })
