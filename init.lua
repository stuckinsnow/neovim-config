-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.g.catppuccin_flavour = "mocha"
-- vim.cmd("colorscheme catppuccin")

vim.opt.clipboard = "unnamedplus"

require("tokyonight").setup({
  style = "moon",
  on_colors = function(colors)
    colors.fg_gutter = "#2b2b2b"
  end,
  on_highlights = function(hl)
    -- hl.LineNrAbove = {
    --   fg = "#f7768e",
    -- }
    -- hl.LineNrBelow = {
    --   fg = "#7aa2f7",s
    -- }

    hl.LineNrAbove = {
      fg = "#9d7cd8", -- TokyoNight purple
    }
    hl.LineNrBelow = {
      fg = "#9ece6a", -- TokyoNight green
    }

  end,
})

vim.cmd("colorscheme tokyonight")

-- vim.o.relativenumber = false
-- Gitsigns setup directly in the main config
require("gitsigns").setup({
  current_line_blame = true, -- Enable blame on the current line by default
})

require("blink.cmp").setup({
  completion = {
    ghost_text = {
      enabled = false, -- Disable ghost text
    },
    completeopt = "menu,menuone,noinsert",
  },
  keymap = {
    ---@diagnostic disable-next-line: assign-type-mismatch
    preset = "default",
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-l>"] = { "select_and_accept" },
    ["<Tab>"] = { "select_and_accept" }, 
    ["<C-y>"] = { "select_and_accept" },
    ["<CR>"] = nil, 
  },
})