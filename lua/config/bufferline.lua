local bufferline = require("bufferline")
bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    sort_by = "insert_after_current",
    separator_style = "thick",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    max_name_length = 30,
    min_name_length = 10,
    tab_size = 30,
  },
})

local config = function()
  vim.keymap.set("n", "<M-s>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-f>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<M-h>", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-l>", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<M-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-6>", "<cmd>BufferLineGoToBuffer 6<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-7>", "<cmd>BufferLineGoToBuffer 7<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<M-8>", "<cmd>BufferLineGoToBuffer 8<cr>", { noremap = true, silent = true })
end

config()
