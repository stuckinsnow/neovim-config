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
