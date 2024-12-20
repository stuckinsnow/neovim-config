-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
--
--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Function to close all windows except the current one and NeoTree
local function close_windows_except_current_and_neotree()
  local current_win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_list_wins()

  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)

    -- Skip the current window and Neo-tree buffer (buffer name includes "neo-tree")
    if win ~= current_win and not buf_name:match("neo%-tree") then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- F1: Close all windows except the current one and NeoTree
map("n", "<F1>", "", {
  noremap = true,
  silent = true,
  callback = close_windows_except_current_and_neotree,
})

-- F2: Split the window vertically
map("n", "<F2>", ":vsplit<CR>", opts)

-- F3: Split the window horizontally
map("n", "<F3>", ":split<CR>", opts)

-- Move line up (Alt + Up Arrow)
vim.api.nvim_set_keymap("n", "<M-Up>", ":m .-2<CR>", { noremap = true, silent = true })

-- Move line down (Alt + Down Arrow)
vim.api.nvim_set_keymap("n", "<M-Down>", ":m .+1<CR>", { noremap = true, silent = true })

-- Duplicate the current line (Shift + Up Arrow)
vim.api.nvim_set_keymap("n", "<S-Up>", "Yp", { noremap = true, silent = true })

-- Duplicate the current line (Shift + Down Arrow)
vim.api.nvim_set_keymap("n", "<S-Down>", "Yp", { noremap = true, silent = true })

-- Press Ctrl + 9 to enter Insert mode
vim.api.nvim_set_keymap("n", "<C-9>", "i", { noremap = true, silent = true })

-- Press Ctrl + 0 to enter Normal mode
vim.api.nvim_set_keymap("i", "<C-0>", "<Esc>", { noremap = true, silent = true })

-- Press Ctrl + 8 to format the document
vim.api.nvim_set_keymap("n", "<C-8>", ":normal! gg=G<CR>", { noremap = true, silent = true })

-- Delete the word before the cursor with Ctrl + Backspace in insert mode
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })

-- Delete the word after the cursor with Ctrl + Delete in insert mode
vim.api.nvim_set_keymap("i", "<C-Del>", "<Space><Esc>caw", { noremap = true, silent = true })

local comment = require("Comment")
local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

comment.setup({
  pre_hook = ts_context_commentstring.create_pre_hook(),
})

vim.keymap.set("n", "<C-S-/>", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<C-S-/>", "gc", { remap = true, desc = "Toggle comment in selection" })

-- Shift + Delete in insert mode: exit to normal mode, delete the line, and re-enter insert mode
vim.keymap.set("i", "<S-Del>", "<Esc>ddi", { desc = "Delete line and stay in insert mode" })

-- Example for copilot.nvim in init.lua
vim.api.nvim_set_keymap("n", "<C-i>", "<Space>aq", { noremap = true, silent = true })