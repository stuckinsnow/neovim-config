-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
--
--
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
vim.keymap.set("n", "<F2>", "", {
  noremap = true,
  silent = true,
  callback = close_windows_except_current_and_neotree,
})

-- F3: Split the window vertically
-- vim.keymap.set("n", "<F3>", ":vsplit<CR>:vertical resize 100<CR>", opts)

-- F3: Split the window vertically with 50% width
vim.keymap.set("n", "<F3>", ":vsplit<CR><C-w>=", opts)

-- F4: Split the window horizontally
vim.keymap.set("n", "<F4>", ":split<CR>", opts)

-- Cycle buffers
vim.keymap.set("n", "<leader>b[", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-s>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b]", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-f>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<M-S>", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-F>", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<M-Left>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<M-1>", ":BufferLineGoToBuffer 1<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-2>", ":BufferLineGoToBuffer 2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-3>", ":BufferLineGoToBuffer 3<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-4>", ":BufferLineGoToBuffer 4<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-5>", ":BufferLineGoToBuffer 5<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-6>", ":BufferLineGoToBuffer 6<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-7>", ":BufferLineGoToBuffer 7<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-8>", ":BufferLineGoToBuffer 8<cr>", { noremap = true, silent = true })

-- Move line up (Alt + Up Arrow)
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>", { noremap = true, silent = true })

-- Move line down (Alt + Down Arrow)
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>", { noremap = true, silent = true })

-- Move multiple line up and down
-- A couple of commands were taken from the primeagens config
-- You can watch his youtube at https://www.youtube.com/@ThePrimeTimeagen
vim.keymap.set("v", "A-j", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "A-k", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Duplicate the current line (Shift + Down Arrow)
vim.keymap.set("n", "<S-Down>", "Yp", { noremap = true, silent = true })

-- Save all
vim.keymap.set("n", "<leader>fa", ":wa<CR>", { noremap = true, silent = true, desc = "Write All Files" })

-- Press Ctrl + 8 to format the document
vim.keymap.set("n", "<C-8>", ":normal! gg=G<CR>", { noremap = true, silent = true })

-- Press Del to delete the character under the cursor without yanking
vim.keymap.set("n", "<Del>", '"_x', { noremap = true, silent = true })

-- Press Backspace to delete the character before the cursor without yanking
vim.keymap.set("n", "<BS>", '"_dh', { noremap = true, silent = true })

-- Delete the word before the cursor with Ctrl + Backspace in insert mode
vim.keymap.set("i", "<C-BS>", "<Left><C-W><Del>", { noremap = true, silent = true })

-- Delete the word after the cursor with Ctrl + Delete in insert mode
vim.keymap.set("i", "<C-Del>", '<Space><Esc>"_caw', { noremap = true, silent = true })

-- Shift + Delete in insert mode: exit to normal mode, delete the line, and re-enter insert mode
vim.keymap.set("i", "<S-Del>", '<Esc>"_ddi', { desc = "Delete line without yanking and stay in insert mode" })

-- Shift + Delete in normal mode: delete the line
vim.keymap.set("n", "<S-Del>", "<Esc>_dd", { desc = "Delete line" })

local comment = require("Comment")
local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

comment.setup({
  pre_hook = ts_context_commentstring.create_pre_hook(),
})

vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Toggle comment in selection" })

-- Remap Ctrl+r to redo
vim.keymap.set("n", "<C-r>", "<C-R>", { desc = "Redo with Ctrl+r" })

vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>gf", ":DiffviewToggleFiles<CR>", { desc = "Toggle Diffview Files Panel" })
vim.keymap.set("n", "<leader>gF", ":DiffviewFocusFiles<CR>", { desc = "Focus Diffview Files Panel" })
vim.keymap.set("n", "<leader>gH", ":DiffviewFileHistory %<CR>", { desc = "Open Diffview File History" })

-- vim.keymap.set("n", "<leader>gn", ":Neogit<CR>", { desc = "Open Neogit" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace line with the content of the register
vim.keymap.set("n", "<C-9>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<C-9>", [["hy:%s/\V<C-r>h//gI<Left><Left><Left>]])
vim.keymap.set("x", "<C-0>", [["hy:'<,'>+10s/\V<C-r>h//gI<Left><Left><Left>]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

local function toggle_home()
  local current_col = vim.fn.col(".")
  if current_col == 1 then
    vim.cmd("normal! ^")
  else
    vim.cmd("normal! 0")
  end
end

vim.keymap.set("n", "<Home>", toggle_home, { noremap = true, silent = true })
vim.keymap.set("i", "<Home>", toggle_home, { noremap = true, silent = true })

vim.keymap.set("n", "<S-End>", "v$", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Home>", "v0", { noremap = true, silent = true })
