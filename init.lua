--- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.g.catppuccin_flavour = "mocha"
-- vim.cmd("colorscheme catppuccin")

vim.opt.clipboard = "unnamedplus"

require("tokyonight").setup({
  style = "storm",
  on_highlights = function(hl, c)
    hl.LineNrAbove = {
      fg = c.green,
    }
    hl.LineNrBelow = {
      fg = c.red,
    }
  end,
})

-- Configure Catppuccin theme
require("catppuccin").setup({
  flavour = "mocha", -- Choose between "latte", "frappe", "macchiato", "mocha"
  custom_highlights = function(colors)
    return {
      LineNrAbove = { fg = colors.green },
      LineNrBelow = { fg = colors.red },
    }
  end,
})

-- Load the Catppuccin theme
-- vim.cmd.colorscheme("catppuccin")

-- Load the tokyonight theme
vim.cmd.colorscheme("tokyonight")

-- vim.o.relativenumber = false
-- Gitsigns setup directly in the main config
require("gitsigns").setup({
  current_line_blame = true, -- Enable blame on the current line by default
})

vim.opt.fileformats = { "unix" }

-- Set tab size to 4 spaces
-- vim.opt.tabstop = 4 -- Number of spaces a tab represents
-- vim.opt.shiftwidth = 4 -- Number of spaces to use for indentation
-- vim.opt.softtabstop = 4 -- How many spaces to insert when hitting <Tab>
-- vim.opt.expandtab = true -- Convert tabs to spaces
-- vim.opt.smarttab = true -- Use smart tabbing

-- vim.g["prettier#config#config"] = {
--   printWidth = 800, -- Allow longer lines before wrapping
--   jsxBracketSameLine = true, -- Keep the closing bracket of JSX on the same line
--   importOrderSeparation = false, -- Keep imports on the same line
--   endOfLine = "auto", -- Force LF line endings
--   noTrailingWhitespace = true, -- Prevent trailing whitespace trimming
--   wrapAttributes = "auto",
-- }

vim.o.undolevels = 10000

require("config.ui")
