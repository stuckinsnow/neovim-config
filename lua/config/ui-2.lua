-- This disables relative line numbers on the inactive buffer
-- Please credit if you use
-- https://github.com/stuckinsnow

-- Enable the custom StatusColumn for all buffers except Neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "minifiles",
  callback = function() end,
})

-- Handle buffer-specific settings on entering a buffer
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.filetype == "minifiles" then
      vim.opt_local.relativenumber = true
      vim.opt_local.number = false
    end
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "minifiles" and vim.bo.filetype ~= "copilot-chat" then
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true
    end
  end,
})

-- Adjust settings on leaving a window
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "minifiles" and vim.bo.filetype ~= "copilot-chat" then
      vim.opt_local.relativenumber = false
      vim.opt_local.number = true
    end
  end,
})
