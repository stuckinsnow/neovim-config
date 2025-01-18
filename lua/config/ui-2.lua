local colors = require("catppuccin.palettes").get_palette("mocha")

-- Define the highlights for active, inactive windows, and current line
local active_highlight = { fg = colors.overlay1 }
local current_line_highlight = { fg = colors.mauve }

-- Apply highlights for active, inactive windows, and current line
vim.api.nvim_set_hl(0, "ActiveWindow", active_highlight)
vim.api.nvim_set_hl(0, "CurrentLine", current_line_highlight)

-- Function to colorize the line number based on window activity
local function colorize_number(number, is_active, is_current_line)
  local highlight_group
  if is_current_line then
    highlight_group = "CurrentLine"
  else
    highlight_group = is_active and "ActiveWindow" or "InactiveWindow"
  end
  return "%#" .. highlight_group .. "#" .. tostring(number)
end

-- Function to handle the StatusColumn
function StatusColumn()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local distance = math.abs(vim.v.lnum - current_line)
  local is_active = vim.api.nvim_get_current_win() == vim.api.nvim_get_current_win()
  local is_current_line = distance == 0
  return colorize_number(is_current_line and current_line or distance, is_active, is_current_line) .. " "
end

-- Enable the custom StatusColumn for all buffers except Neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt_local.statuscolumn = ""
  end,
})

-- Handle buffer-specific settings on entering a buffer
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "copilot-chat" then
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true
      vim.opt_local.statuscolumn = "%s%{%v:lua.StatusColumn()%}"
    end
  end,
})

-- Adjust settings on leaving a window
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "copilot-chat" then
      vim.opt_local.relativenumber = false
      vim.opt_local.number = true
      vim.opt_local.statuscolumn = "%s%l"
    end
  end,
})
