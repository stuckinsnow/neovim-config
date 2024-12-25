--- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.g.catppuccin_flavour = "mocha"
-- vim.cmd("colorscheme catppuccin")

vim.opt.clipboard = "unnamedplus"

require("tokyonight").setup({
  style = "moon",
  on_highlights = function(hl)
    hl.LineNrAbove = {
      fg = "#6ab8ff",
    }
    hl.LineNrBelow = {
      fg = "#ff6188",
    }
  end,
})

vim.cmd("colorscheme tokyonight")

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

vim.g["prettier#config#config"] = {
  printWidth = 800, -- Allow longer lines before wrapping
  jsxBracketSameLine = true, -- Keep the closing bracket of JSX on the same line
  importOrderSeparation = false, -- Keep imports on the same line
  endOfLine = "auto", -- Force LF line endings
  noTrailingWhitespace = true, -- Prevent trailing whitespace trimming
  wrapAttributes = "auto",
}
