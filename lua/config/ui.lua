local colors = require("catppuccin.palettes").get_palette("mocha")

-- Define the rainbow colors for the first digit, and range colors for others
local rainbow_colors = {
  colors.red,
  colors.peach,
  colors.yellow,
  colors.green,
  colors.blue,
  colors.teal,
  colors.lavender,
  colors.mauve,
  colors.pink,
  colors.surface2,
}

-- Define the highlights for the digit ranges
local digit_highlights_ranges = {
  { fg = colors.red },
  { fg = colors.red },
  { fg = colors.peach },
  { fg = colors.yellow },
  { fg = colors.green },
  { fg = colors.blue },
  { fg = colors.lavender },
  { fg = colors.mauve },
  { fg = colors.pink },
  { fg = colors.surface2 },
}

-- Apply highlights for each color range
for i, color in ipairs(digit_highlights_ranges) do
  vim.api.nvim_set_hl(0, "DigitRange" .. i, color)
end

-- Function to colorize each digit of a number
local function colorize_number(number, is_relative)
  local result = ""
  local num_str = tostring(number)
  -- local start_index, end_index

  -- Handle negative numbers (for the '-' sign)
  local is_negative = num_str:sub(1, 1) == "-"
  if is_negative then
    result = result .. "%#DigitRange1#-" -- Use the red color for negative sign
    num_str = num_str:sub(2) -- Remove the negative sign for processing
  end

  -- Determine the range for the first digit (using rainbow colors)
  local num_value = math.abs(number)
  local range_index = math.floor(num_value / 10) + 1
  local highlight_group = "DigitRange" .. range_index

  if is_relative then
    -- Reverse the rainbow for relative numbers (line number above)
    local reversed_rainbow_index = (#rainbow_colors - (num_value % #rainbow_colors) + 1) % #rainbow_colors
    result = result .. "%#DigitRainbow" .. reversed_rainbow_index + 1 .. "#" .. num_str:sub(1, 1)
  else
    -- Apply rainbow color for first digit
    local rainbow_index = (num_value - 1) % #rainbow_colors + 1
    result = result .. "%#DigitRainbow" .. rainbow_index .. "#" .. num_str:sub(1, 1)
  end

  -- Apply the remaining digits based on the number range (fixed color)
  for i = 2, #num_str do
    result = result .. "%#" .. highlight_group .. "#" .. num_str:sub(i, i)
  end

  return result
end

-- Function to handle the StatusColumn
function StatusColumn()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local distance = math.abs(vim.v.lnum - current_line)
  local is_relative = distance > 0 and distance < current_line -- Check if line is relative
  return colorize_number(distance == 0 and current_line or distance, is_relative) .. " "
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
